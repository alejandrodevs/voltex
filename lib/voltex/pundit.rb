module Voltex
  module Pundit
    def permission?(resource, action)
      !!Voltex.current_permissions.detect do |permission|
        permission.resource == resource.to_s &&
          permission.action == action.to_s
      end
    end
  end
end
