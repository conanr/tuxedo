module StyleStyle
  class CaneViolation
    class SyntaxViolation < CaneViolation
      attr_accessor :file_name

      def self.from_cane(cane_violation)
        violation = new

        violation.file_name   = cane_violation.file_name

        violation
      end

      def description
        "Files contained invalid syntax"
      end

      def to_hash
        {
          :violation_type => violation_type,
          :file_name      => file_name,
          :description    => description,
        }
      end
    end
  end
end
