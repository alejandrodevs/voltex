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
         belongs_to :#{Voltex.role_name}
         has_many :#{Voltex.permissions_name}, through: :#{Voltex.role_name}"
      end
    end
  end
end
