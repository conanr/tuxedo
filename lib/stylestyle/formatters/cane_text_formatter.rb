require 'stylestyle/formatters/base_text_formatter'

module StyleStyle
  module Formatters
    class CaneTextFormatter < BaseTextFormatter
      def format(violations)
        with_color(STDOUT.tty?) do
          format_violations_of_type(violations, "AbcMaxViolation")
          format_style_violations(violations)
          format_violations_of_type(violations, "SyntaxViolation")
          format_violations_of_type(violations, "ThresholdViolation")
          format_violations_of_type(violations, "UndocumentedClassViolation", :line_number)
        end
      end

      private

      def format_violations_of_type(violations, type, selector=nil)
        violations = violations.select {|v| v.violation_type == type}.group_by(&:file_name)

        if violations.any?
          message yellow type
          message_separator

          format_grouped_by_file_name(violations, selector)
          message ""
        end
      end

      def format_style_violations(violations)
        # Too Long Lines
        style_violations = violations.select {|v| v.violation_type == "StyleViolation"}
        too_long_lines =
          style_violations.
            select {|v| v.style_violation_type == "LineTooLong"}.
            group_by(&:file_name)

        if too_long_lines.any?
          max = too_long_lines.values.first.first.max_char_count
          message yellow "Line is >#{max} characters"
          message_separator
          format_grouped_by_file_name(too_long_lines, :line_number)
          message ""
        end
      end

      def message_separator
        message green "------------------------------------"
      end

      def format_grouped_by_file_name(violations, selector=nil)
        return unless violations.any?

        if selector
          violations.each do |file, vs|
            puts violations.to_a if vs.nil?
            lines = vs.map {|v| green v.send(selector)}.join(", ")
            message "#{file} [#{lines}]"
          end
        else
          violations.each do |file, vs|
            message file
          end
        end
      end
    end
  end
end
