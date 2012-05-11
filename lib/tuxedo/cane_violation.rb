require 'tuxedo/cane_violation/abc_max_violation'
require 'tuxedo/cane_violation/undocumented_class_violation'
require 'tuxedo/cane_violation/style_violation'
require 'tuxedo/cane_violation/syntax_violation'
require 'tuxedo/cane_violation/threshold_violation'

module Tuxedo
  class CaneViolation
    def self.from_cane(cane_violation)
      type  = cane_violation.class.name.split('::').last
      klazz = const_defined?(type) && const_get(type)
      klazz && klazz.from_cane(cane_violation)
    end

    def violation_type
      self.class.name.split("::").last
    end

    def violation_type_snake_cased
      _underscore(violation_type)
    end

    private

    def _underscore(string)
      string = string.gsub(/([A-Z\d]+)([A-Z][a-z])/,'\1_\2')
      string = string.gsub(/([a-z\d])([A-Z])/,'\1_\2')
      string.downcase
    end
  end
end
