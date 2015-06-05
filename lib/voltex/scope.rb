module Voltex
  module Scope
    extend ActiveSupport::Concern

    included do
      before_action :set_current_permissions
    end

    protected

    def set_current_permissions
      return unless defined?(current_user)
      Voltex.current_permissions = current_permissions
    end

    def current_permissions
      current_user.send(Voltex.permissions_name).to_a
    end
  end
end
