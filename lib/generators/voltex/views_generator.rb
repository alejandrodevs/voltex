module Voltex
  module Generators
    class ViewsGenerator < Rails::Generators::Base
      source_root File.expand_path('../../../../app/views/voltex', __FILE__)
      desc 'Creates voltex views.'

      def create_views
        directory 'roles', 'app/views/voltex/roles'
      end
    end
  end
end
