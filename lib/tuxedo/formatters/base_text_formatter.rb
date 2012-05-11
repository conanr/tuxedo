require 'tuxedo/formatters/base_formatter'

module Tuxedo
  module Formatters
    class BaseTextFormatter < BaseFormatter
      include Tty

      def message(message)
        output.puts message
      end
    end
  end
end
