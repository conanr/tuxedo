require 'rake'
require 'rake/tasklib'
require 'stylestyle'

module StyleStyle
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    attr_accessor :name
    attr_accessor :fail_on_error

    def initialize(*args)
      @name = args.shift || :style
      @fail_on_error = true

      yield self if block_given?

      task name do
        StyleStyle.output_to_console
      end
    end
  end
end
