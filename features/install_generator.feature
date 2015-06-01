Feature: Install generator

  Background:
    When I generate a new rails application
    And I configure the application to use voltex

  Scenario: Creates voltex initializer
    Given I successfully run `bundle exec rails g voltex:install`
    Then the file "config/initializers/voltex.rb" should contain:
    """
    Voltex.setup do |config|
      # Configurable options should be here.
      # config.user_class = 'User'
      # config.role_class = 'Role'
      # config.permission_class = 'Permission'
    end
    """
