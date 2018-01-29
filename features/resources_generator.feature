Feature: Resources generator
  This generator creates models or adds them some code in order to
  work properly. This creates migrations to create or update some
  database tables.

  Background:
    When I generate a new rails application
    And I run `bundle exec rails g voltex:install`

  Scenario: Creates default voltex resources
    When I run `bundle exec rails g voltex:resources`
    Then the model "User" should contain:
      """
      class User < ApplicationRecord
        # Voltex.
        # Please review the following content.
        belongs_to :role
        has_many :permissions, through: :role
      end
      """
    And the model "Role" should contain:
      """
      class Role < ApplicationRecord
        # Voltex.
        # Please review the following content.
        has_many :users
        has_and_belongs_to_many :permissions
      end
      """
    And the model "Permission" should contain:
      """
      class Permission < ApplicationRecord
        # Voltex.
        # Please review the following content.
        has_and_belongs_to_many :roles
      end
      """
    And the migration "voltex_create_users" should contain:
      """
      class VoltexCreateUsers < ActiveRecord::Migration[5.1]
        def change
          create_table(:users) do |t|
            t.string :name
            t.references :role
            t.timestamps null: false
          end
        end
      end
      """
    And the migration "voltex_create_roles" should contain:
      """
      class VoltexCreateRoles < ActiveRecord::Migration[5.1]
        def change
          create_table(:roles) do |t|
            t.string :name
            t.timestamps null: false
          end
        end
      end
      """
    And the migration "voltex_create_permissions" should contain:
      """
      class VoltexCreatePermissions < ActiveRecord::Migration[5.1]
        def change
          create_table(:permissions) do |t|
            t.string :resource
            t.string :action
            t.timestamps null: false
          end
        end
      end
      """
    And the migration "voltex_create_permissions_roles" should contain:
      """
      class VoltexCreatePermissionsRoles < ActiveRecord::Migration[5.1]
        def change
          create_table(:permissions_roles) do |t|
            t.references :permission
            t.references :role
          end
        end
      end
      """
