module StyleStyle
  class CaneViolation
    class UndocumentedClassViolation < CaneViolation
      attr_accessor :file_name, :line_number, :line

      def self.from_cane(cane_violation)
        violation = new

        violation.file_name   = cane_violation.file_name
        violation.line_number = cane_violation.number
        violation.line        = cane_violation.line

        violation
      end

      def description
        "Classes are not documented"
      end

      def class_name(line)
        line.match(/class (\S+)/)[1]
      end

      def to_hash
        {
          :violation_type => violation_type,
          :file_name      => file_name,
          :line_number    => line_number,
          :line           => line,
          :description    => description,
        }
      end
    end
  end
end
