module Voltex
  class Engine < ::Rails::Engine
    isolate_namespace Voltex

    ActiveSupport.on_load(:action_controller) do
      include Voltex::Scope
    end
  end
end
