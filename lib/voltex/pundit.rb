module Voltex
  module Pundit
    def permission?(resource, action)
      user.send(permissions).where(
        resource: resource.to_s,
        action: action
      ).exists?
    end

    private

    def permissions
      Voltex.permission_class.underscore.parameterize('_').pluralize
    end
  end
end
