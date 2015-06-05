module Voltex
  module CanCan
    module Ability
      def define_voltex_abilities(user)
        Voltex.current_permissions.each do |permission|
          can permission.action.to_sym, permission.resource.constantize
        end
      end
    end
  end
end
