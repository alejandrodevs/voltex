module Voltex
  module Setup
    mattr_accessor :actions
    @@actions = %w(index show create update destroy)

    mattr_accessor :user_class
    @@user_class = 'User'

    mattr_accessor :role_class
    @@role_class = 'Role'

    mattr_accessor :permission_class
    @@permission_class = 'Permission'

    def permission_role_class
      [permission_class, role_class].sort.join
    end

    mattr_accessor :exclude
    @@exclude = []

    mattr_accessor :include
    @@include = []

    def setup
      yield(self) if block_given?
    end
  end
end
