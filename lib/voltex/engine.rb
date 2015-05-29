require 'voltex/setup'

module Voltex
  extend Setup

  class Engine < ::Rails::Engine
    isolate_namespace Voltex
  end
end
