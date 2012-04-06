module StyleStyle
  class ReekParser

    def self.parse_reek(reek_output)
      reek_hash = YAML::load(clean_reek(reek_output))
    end

    def self.clean_reek(reek_output)
      reek_output.gsub("- !ruby/object:Reek::SmellWarning","smell_warning:")
    end
  end
end