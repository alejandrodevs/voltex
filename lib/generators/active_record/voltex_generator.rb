module ActiveRecord
  module Generators
    module VoltexGenerator
      extend ActiveSupport::Concern

      included do
        argument :attributes, type: :array, default: []

        def copy_migration
          table_exists? ? existing_migration : new_migration
        end

        def generate_model
          unless model_exists?
            invoke 'active_record:model', [name], migration: false, skip_namespace: true
          end
        end

        def add_model_content
          inject_into_class(model_path, name, sanitized_content) if model_exists?
        end

        private

        def new_migration
          migration_template 'migration.rb', "db/migrate/voltex_create_#{table_name}.rb"
        end

        def existing_migration
          migration_template 'migration_existing.rb', "db/migrate/add_voltex_to_#{table_name}.rb"
        end

        def model_exists?
          File.exists?(File.join(destination_root, model_path))
        end

        def model_path
          File.join('app', 'models', "#{class_name.underscore}.rb")
        end

        def sanitized_content
          model_content.split("\n").map { |line| '  ' + line.strip }.join("\n") << "\n"
        end

        def namespaced?
          false
        end

        def table_exists?
          ActiveRecord::Base.connection.table_exists? table_name
        end

        def migration_class_name
          Rails.version.to_i == 5 ?
            "ActiveRecord::Migration[#{ActiveRecord::Migration.current_version}]":
            'ActiveRecord::Migration'
        end
      end
    end
  end
end
