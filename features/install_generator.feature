Feature: Install generator
  This feature takes place when user runs 'rails g voltex:install'
  after he has included voltex in the project.

  Background:
    When I generate a new rails application
    And I configure the application to use voltex

  Scenario: Creates voltex initializer
    When I successfully run `bundle exec rails g voltex:install`
    Then the file "config/initializers/voltex.rb" should contain:
    """
    Voltex.setup do |config|
      # Voltex classes configuration.
      # config.user_class = 'User'
      # config.role_class = 'Role'
      # config.permission_class = 'Permission'
      #
      # Default actions.
      # config.default_actions = %w(index show create update destroy)
      #
      # Excluding default permissions.
      # config.exclude = [
      #   { resource: 'User', action: 'destroy' },
      # ]
      #
      # Including other permissions.
      # config.include = [
      #   { resource: 'User', action: 'report' },
      # ]
    end
    """
