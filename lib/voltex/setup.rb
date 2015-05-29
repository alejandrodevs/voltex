module Voltex
  module Setup
    mattr_accessor :user_class
    @@user_class = 'User'

    mattr_accessor :role_class
    @@user_class = 'Role'

    mattr_accessor :permission_class
    @@user_class = 'Permission'

    def setup
      yield if block_given?
    end
  end
end
