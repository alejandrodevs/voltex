require 'rails/generators/active_record'
require 'generators/voltex/helpers'
require 'generators/active_record/voltex_generator'

module ActiveRecord
  module Generators
    class VoltexUserGenerator < VoltexGenerator
      source_root File.expand_path('../templates', __FILE__)

      def create_user_model
        template 'user_model.rb', "app/models/#{file_name}.rb"
      end

      def create_users_migration
        migration_template 'user_migration.rb', "db/migrate/voltex_create_#{table_name}.rb"
      end
    end
  end
end
