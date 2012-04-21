require 'stringio'

module StyleStyle
  module Formatters
    class BaseFormatter
      attr_reader :output

      def initialize(output=nil)
        @output = output || StringIO.new
      end

      def format(metrics)
        # NOP
      end

      private

      def _underscore(string)
        string = string.gsub(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
        string = string.gsub(/([a-z\d])([A-Z])/,'\1_\2')
        string.downcase
      end
    end
  end
end
