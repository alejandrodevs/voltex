require 'rails/generators/active_record'
require 'generators/active_record/voltex_generator'

module ActiveRecord
  module Generators
    class VoltexUserGenerator < ActiveRecord::Generators::Base
      include VoltexGenerator
      source_root File.expand_path('../templates/user', __FILE__)

      private

      def model_content
        "# Voltex.
         # Please review the following content.
         belongs_to :#{role}
         has_many :#{permissions}, through: :#{role}"
      end

      def role
        Voltex.role_class.underscore.parameterize('_')
      end

      def permissions
        Voltex.permission_class.underscore.parameterize('_').pluralize
      end
    end
  end
end
