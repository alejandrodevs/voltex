Feature: Custom resources generator
  This generator creates not default models or adds them some code
  in order to work properly. This creates migrations to create or
  update some not default model's tables.

  Background:
    When I generate a new rails application
    And I configure the application to use voltex
    And I successfully run `bundle exec rails g voltex:install`

  Scenario: Creates custom voltex resources
    Given a file named "config/initializers/voltex.rb" with:
    """
    Voltex.setup do |config|
      # Configurable options should be here.
      config.user_class = 'Member'
      config.role_class = 'Group'
      # config.permission_class = 'Permission'
    end
    """
    And I successfully run `bundle exec rails g voltex:resources`
    Then the model "member.rb" should contain:
    """
    class Member < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      belongs_to :group
      has_many :permissions, through: :group
    end
    """
    And the model "group.rb" should contain:
    """
    class Group < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      has_many :members
      has_and_belongs_to_many :permissions
    end
    """
    And the model "permission.rb" should contain:
    """
    class Permission < ActiveRecord::Base
      # Voltex.
      # Please review the following content.
      has_and_belongs_to_many :groups
    end
    """
    And the migration "_voltex_create_members.rb" should contain:
    """
    class VoltexCreateMembers < ActiveRecord::Migration
      def change
        create_table(:members) do |t|
          t.string :name
          t.integer :group_id
          t.timestamps null: false
        end

        add_index :members, :group_id
      end
    end
    """
    And the migration "_voltex_create_groups.rb" should contain:
    """
    class VoltexCreateGroups < ActiveRecord::Migration
      def change
        create_table(:groups) do |t|
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
    And the migration "_voltex_create_group_permissions.rb" should contain:
    """
    class VoltexCreateGroupPermissions < ActiveRecord::Migration
      def change
        create_table(:group_permissions) do |t|
          t.references :permission
          t.references :group
        end
      end
    end
    """
