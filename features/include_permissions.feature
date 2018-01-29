Feature: Include not default permissions
  This feature takes place when user wants to include some permissions
  that won't be created when runs 'rake voltex'.

  Background:
    When I generate a new rails application
    And I run `bundle exec rails g voltex:install`
    And I run `bundle exec rails g voltex:resources`
    And I run `bundle exec rake db:migrate`

  Scenario: Include permissions
    Given a file named "config/initializers/voltex.rb" with:
      """
      Voltex.setup do |config|
        # Configurable options should be here.
        # config.user_class = 'User'
        # config.role_class = 'Role'
        # config.permission_class = 'Permission'
        #
        config.include = [
          { resource: 'Member', action: 'enable' },
          { resource: 'Payment', action: 'cancel' },
        ]
      end
      """
    And I generate models "Member Payment"
    When I run `bundle exec rake voltex`
    Then I have "enable" permissions for "Member"
    And I have "cancel" permissions for "Payment"
