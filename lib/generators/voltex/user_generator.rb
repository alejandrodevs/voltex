module Voltex
  module Generators
    class UserGenerator < Rails::Generators::Base
      desc 'Creates a voltex user resource.'
      hook_for :orm, as: :voltex_user
    end
  end
end
