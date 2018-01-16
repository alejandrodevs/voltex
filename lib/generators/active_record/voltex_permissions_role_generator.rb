require 'rails/generators/active_record'
require 'generators/active_record/voltex_generator'

module ActiveRecord
  module Generators
    class VoltexPermissionsRoleGenerator < ActiveRecord::Generators::Base
      include VoltexGenerator

      source_root File.expand_path('../templates/permissions_role', __FILE__)

      def generate_model
        # There wont be a model.
      end

      def add_model_content
        # There wont be a model.
      end
    end
  end
end
