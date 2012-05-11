module Tuxedo
  class CaneViolation
    class StyleViolation < CaneViolation
      attr_accessor :file_name, :line_number, :message
      attr_accessor :style_violation_type, :max_char_count, :char_count

      def self.from_cane(cane_violation)
        violation = new

        violation.file_name   = cane_violation.file_name
        violation.line_number = cane_violation.line
        violation.message     = cane_violation.message

        if cane_violation.message.match /Line is >(\d+) characters \((\d+)\)/
          violation.style_violation_type = "LineTooLong"
          violation.max_char_count       = $1.to_i
          violation.char_count           = $2.to_i
        end

        violation
      end

      def description
        "Lines violated style requirements"
      end

      def to_hash
        {
          :violation_type       => violation_type,
          :file_name            => file_name,
          :line                 => line,
          :style_violation_type => style_violation_type,
          :max_char_count       => max_char_count,
          :char_count           => char_count,
          :description          => description,
        }
      end
    end
  end
end
