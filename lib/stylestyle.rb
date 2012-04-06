module StyleStyle
  class Runner
    def self.run_cane
      output = `cane`
    end
    def self.run_reek
      # "reek . 2>&1"
      output = `reek -qy .`
      output = output.gsub("- !ruby/object:Reek::SmellWarning","smell_warning:")
      parse_reek(output)
    end
  end
end