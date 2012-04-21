require 'stylestyle/formatters/base_text_formatter'

module StyleStyle
  module Formatters
    class CaneTextFormatter < BaseTextFormatter
      def format(metrics)
        style_violations = metrics.select {|v| v.violation_type == "StyleViolation"}
        too_long_lines =
          style_violations.
            select {|v| v.style_violation_type == "LineTooLong"}.
            group_by(&:file_name)

        if too_long_lines.any?
          max = too_long_lines.values.first.first.max_char_count
          message "Line is >#{max} characters"
          message_separator
          format_grouped_by_file_name(too_long_lines)
          message ""
        end
      end

      private

      def message_separator
        message "------------------------------------"
      end

      def format_grouped_by_file_name(violations)
        violations.each do |file, vs|
          lines = vs.map(&:line_number).join(", ")
          message "#{file} [#{lines}]"
        end
      end
    end
  end
end
