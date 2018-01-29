When 'I generate a new rails application' do
  steps %{
    When I run `rails plugin new dummy`
    When I run `mv dummy/test/dummy #{APP_NAME}`
    When I overwrite the file named "#{APP_NAME}/config/application.rb" with:
      """
      require_relative 'boot'

      require 'rails/all'

      Bundler.require(*Rails.groups)

      module Dummy
        class Application < Rails::Application
          # Initialize configuration defaults for originally generated Rails version.
          config.load_defaults 5.1

          # Settings in config/environments/* take precedence over those specified here.
          # Application configuration should go into files in config/initializers
          # -- all .rb files in that directory are automatically loaded.
        end
      end
      """
    And I cd to "#{APP_NAME}"
    And I append to "Gemfile" with:
      """
      gem 'sqlite3'
      gem 'voltex', path: '#{VOLTEX_ROOT}'
      """
    And I run `bundle install --local`
  }

  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path("#{APP_ROOT}/config/environment.rb",  __FILE__)
  ENV['RAILS_ROOT'] ||= APP_ROOT
end

When /^the model(?: named)? "([^"]*)" should (not )?contain:$/ do |model, negated, content|
  file = Dir["#{APP_ROOT}/app/models/*#{model.downcase}.rb"].first.split("#{APP_NAME}/").last
  expect(file).to have_file_content file_content_including(content.chomp)
end

When /^the migration(?: named)? "([^"]*)" should (not )?contain:$/ do |migration, negated, content|
  file = Dir["#{APP_ROOT}/db/migrate/*#{migration}.rb"].first.split("#{APP_NAME}/").last
  expect(file).to have_file_content file_content_including(content.chomp)
end

When /^I generate models "([^\"]+)"$/ do |models|
  models.split(' ').each do |model|
    steps %{
      When I write to "app/models/#{model.downcase}.rb" with:
        """\nclass #{model} < ActiveRecord::Base\nend\n"""
    }
  end
end

When /^I have (not )?"([^\"]+)" permissions for "([^\"]+)"$/ do |match, actions, resources|
  resources.split(' ').each do |resource|
    actions.split(' ').each do |action|
      expect(Voltex.permission_class.constantize.where(
        resource: resource, action: action
      ).exists?).to be !match
    end
  end
end
