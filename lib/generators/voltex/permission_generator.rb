module Voltex
  module Generators
    class PermissionGenerator < Rails::Generators::Base
      desc 'Creates a voltex permission resource.'
      hook_for :orm, as: :voltex_permission
    end
  end
end
