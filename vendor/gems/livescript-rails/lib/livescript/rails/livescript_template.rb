require 'tilt/template'
require 'livescript'

module Livescript
  module Rails
    class LivescriptTemplate < Tilt::Template
      self.default_mime_type = 'application/javascript'

      @@default_bare = false

      def self.default_bare
        @@default_bare
      end

      def self.default_bare=(value)
        @@default_bare = value
      end

      def self.engine_initialized?
        defined? ::LiveScript && ::LiveScript.respond_to?('compile')
      end

      def initialize_engine
      end

      def prepare
        if !options.key?(:bare) and !options.key?(:no_wrap)
          options[:bare] = self.class.default_bare
        end
      end

      def evaluate(scope, locals, &block)
        @output ||= LiveScript.compile(data, options)
      end

      def allows_script?
        false
      end
    end
  end
end
