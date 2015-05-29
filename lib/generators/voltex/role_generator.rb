module Voltex
  module Generators
    class RoleGenerator < Rails::Generators::Base
      desc 'Creates a voltex role resource.'
      hook_for :orm, as: :voltex_role
    end
  end
end
