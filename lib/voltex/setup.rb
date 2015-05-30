module Voltex
  module Setup
    mattr_accessor :user_class
    @@user_class = 'User'

    mattr_accessor :role_class
    @@role_class = 'Role'

    mattr_accessor :permission_class
    @@permission_class = 'Permission'

    def setup
      yield(self) if block_given?
    end
  end
end
