module Voltex
  module Pundit
    def permission?(resource, action)
      user.send(Voltex.permissions_name).where(
        resource: resource.to_s,
        action: action
      ).exists?
    end
  end
end
