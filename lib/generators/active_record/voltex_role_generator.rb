require 'rails/generators/active_record'
require 'generators/active_record/voltex_generator'

module ActiveRecord
  module Generators
    class VoltexRoleGenerator < ActiveRecord::Generators::Base
      include VoltexGenerator
      source_root File.expand_path('../templates/role', __FILE__)

      private

      def existing_migration
        # There won't be a existing migration.
      end

      def model_content
        "# Voltex.
         # Please review the following content.
         has_many :#{Voltex.users_name}
         has_and_belongs_to_many :#{Voltex.permissions_name}"
      end
    end
  end
end
