module Voltex
  module CanCan
    module Ability
      def define_voltex_abilities(user)
        user.send(permissions).each do |permission|
          can permission.action.to_sym, permission.resource.constantize
        end
      end

      private

      def permissions
        Voltex.permission_class.underscore.parameterize('_').pluralize
      end
    end
  end
end
