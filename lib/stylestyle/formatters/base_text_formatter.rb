require 'stylestyle/formatters/base_formatter'

module StyleStyle
  module Formatters
    class BaseTextFormatter < BaseFormatter
      include Tty

      def message(message)
        output.puts message
      end
    end
  end
end
