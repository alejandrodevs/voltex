require 'rails/generators/active_record'
require 'generators/active_record/voltex_generator'

module ActiveRecord
  module Generators
    class VoltexRoleGenerator < ActiveRecord::Generators::Base
      include VoltexGenerator
      source_root File.expand_path('../templates/role', __FILE__)

      private

      def model_content
        "# Voltex.
         # Please review the following content.
         has_many :#{users}
         has_and_belongs_to_many :#{permissions}"
      end

      def users
        Voltex.user_class.underscore.parameterize('_').pluralize
      end

      def permissions
        Voltex.permission_class.underscore.parameterize('_').pluralize
      end
    end
  end
end
