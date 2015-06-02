Feature: Resources generator
  This generator creates models or adds them some code in order to
  work properly. This creates migrations to create or update some
  database tables.

  Background:
    When I generate a new rails application
    And I configure the application to use voltex
    And I successfully run `bundle exec rails g voltex:install`

  Scenario: Creates default voltex resources
    When I successfully run `bundle exec rails g voltex:resources`
    Then the model "user.rb" should contain:
    """
    class User < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      belongs_to :role
      has_many :permissions, through: :role
    end
    """
    And the model "role.rb" should contain:
    """
    class Role < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      has_many :users
      has_and_belongs_to_many :permissions
    end
    """
    And the model "permission.rb" should contain:
    """
    class Permission < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      has_and_belongs_to_many :roles
    end
    """
    And the migration "_voltex_create_users.rb" should contain:
    """
    class VoltexCreateUsers < ActiveRecord::Migration
      def change
        create_table(:users) do |t|
          t.string :name
          t.integer :role_id
          t.timestamps null: false
        end

        add_index :users, :role_id
      end
    end
    """
    And the migration "_voltex_create_roles.rb" should contain:
    """
    class VoltexCreateRoles < ActiveRecord::Migration
      def change
        create_table(:roles) do |t|
          t.string :name
          t.timestamps null: false
        end
      end
    end
    """
    And the migration "_voltex_create_permissions.rb" should contain:
    """
    class VoltexCreatePermissions < ActiveRecord::Migration
      def change
        create_table(:permissions) do |t|
          t.string :resource
          t.string :action
          t.timestamps null: false
        end
      end
    end
    """
    And the migration "_voltex_create_permission_roles.rb" should contain:
    """
    class VoltexCreatePermissionRoles < ActiveRecord::Migration
      def change
        create_table(:permission_roles) do |t|
          t.references :permission
          t.references :role
        end
      end
    end
    """
