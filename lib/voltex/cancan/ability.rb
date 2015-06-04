module Voltex
  module CanCan
    module Ability
      def define_voltex_abilities(user)
        user.send(Voltex.permissions_name).each do |permission|
          can permission.action.to_sym, permission.resource.constantize
        end
      end
    end
  end
end
