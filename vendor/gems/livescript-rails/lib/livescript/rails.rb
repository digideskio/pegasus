require 'livescript/rails/livescript_template'
require 'rails/engine'

module Livescript
  module Rails
    class Engine < ::Rails::Engine
      config.app_generators.javascript_engine :ls
      initializer :register_livescript do |app|
        app.config.assets.configure do |env|
          env.register_engine('.ls', LivescriptTemplate)
        end
      end
    end
  end
end
