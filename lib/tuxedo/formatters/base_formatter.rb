require 'stringio'

module Tuxedo
  module Formatters
    class BaseFormatter
      attr_reader :output

      def initialize(output=nil)
        @output = output || StringIO.new
      end

      def format(metrics)
        # NOP
      end
    end
  end
end
