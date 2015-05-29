require 'rails/generators/active_record'
require 'generators/voltex/helpers'

module ActiveRecord
  module Generators
    class VoltexGenerator < ActiveRecord::Generators::Base
      include Voltex::Generators::Helpers
      argument :attributes, type: :array, default: []

      def namespaced?
        false
      end
    end
  end
end
