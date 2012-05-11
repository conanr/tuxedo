module Tuxedo
  class CaneViolation
    class ThresholdViolation < CaneViolation
      attr_accessor :name, :operator, :value, :limit

      def self.from_cane(cane_violation)
        violation = new

        violation.name     = cane_violation.name
        violation.operator = cane_violation.operator
        violation.value    = cane_violation.value
        violation.limit    = cane_violation.limit

        violation
      end

      def description
        "Quality threshold crossed"
      end

      def to_hash
        {
          :violation_type => violation_type,
          :name           => name,
          :operator       => operator,
          :value          => value,
          :limit          => limit,
          :description    => description,
        }
      end
    end
  end
end
