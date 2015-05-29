module Voltex
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      desc 'Creates a voltex initializer'

      def create_initializer
        template 'voltex.rb', 'config/initializers/voltex.rb'
      end
    end
  end
end
