Feature: Exclude default permissions
  This feature takes place when user wants to exclude some default
  permissions that will be created when runs 'rake voltex'.

  Background:
    When I generate a new rails application
    And I successfully run `bundle exec rails g voltex:install`
    And I successfully run `bundle exec rails g voltex:resources`
    And I successfully run `bundle exec rake db:migrate`

  Scenario: Exclude permissions
    Given a file named "config/initializers/voltex.rb" with:
      """
      Voltex.setup do |config|
        # Configurable options should be here.
        # config.user_class = 'User'
        # config.role_class = 'Role'
        # config.permission_class = 'Permission'
        #
        config.exclude = [
          { resource: 'Post', action: 'update' },
          { resource: 'Product' },
        ]
      end
      """
    And I generate models "Post Product"
    When I successfully run `bundle exec rake voltex`
    Then I have not "update" permissions for "Post"
    And I have not "index show create update destroy" permissions for "Product"
