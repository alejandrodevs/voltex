module Voltex
  module Setup
    mattr_accessor :default_actions
    @@default_actions = %w(index show create update destroy)

    mattr_accessor :user_class
    @@user_class = 'User'

    mattr_accessor :role_class
    @@role_class = 'Role'

    mattr_accessor :permission_class
    @@permission_class = 'Permission'

    mattr_accessor :exclude
    @@exclude = []

    mattr_accessor :include
    @@include = []


    def current_permissions=(permissions)
      RequestStore.store[:current_permissions] = permissions
    end

    def current_permissions
      RequestStore.store[:current_permissions] || []
    end

    def permissions_role_class
      [permission_class, role_class].map(&:pluralize).sort.join.singularize
    end

    %w(user role permission).each do |resource|
      define_method "#{resource}_model" do
        send("#{resource}_class").constantize
      end

      define_method "#{resource}_name" do
        send("#{resource}_class").underscore.parameterize(separator: '_')
      end

      define_method "#{resource.pluralize}_name" do
        send("#{resource}_name").pluralize
      end
    end

    def setup
      yield(self) if block_given?
    end
  end
end
