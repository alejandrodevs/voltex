module Voltex
  module Generators
    class ResourcesGenerator < Rails::Generators::Base
      desc 'Creates voltex resources.'

      def create_resources
        Rails::Generators.invoke "#{orm}:voltex_user", [Voltex.user_class]
        Rails::Generators.invoke "#{orm}:voltex_role", [Voltex.role_class]
        Rails::Generators.invoke "#{orm}:voltex_permission", [Voltex.permission_class]
        Rails::Generators.invoke "#{orm}:voltex_permission_role", [Voltex.permission_role_class]
      end

      private

      def orm
        Rails.configuration.generators.options[:rails][:orm]
      end
    end
  end
end
