require 'rake'
require 'rake/tasklib'
require 'stylestyle'

module StyleStyle
  class RakeTask < ::Rake::TaskLib
    include ::Rake::DSL if defined?(::Rake::DSL)

    attr_accessor :name

    def initialize(*args)
      @name = args.shift || :style

      task name do
        StyleStyle.output_to_console
      end
    end
  end
end
