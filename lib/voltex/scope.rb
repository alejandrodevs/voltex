module Voltex
  module Scope
    extend ActiveSupport::Concern

    protected

    def set_current_permissions
      return unless voltex_user || voltex_user.respond_to?(Voltex.permissions_name)
      Voltex.current_permissions = voltex_user.send(Voltex.permissions_name).to_a
    end

    def voltex_user
      return unless defined?(current_user)
      current_user
    end
  end
end
