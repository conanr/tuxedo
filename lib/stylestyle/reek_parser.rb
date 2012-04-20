module StyleStyle
  class ReekParser
    attr_accessor :result

    def initialize
      self.result = { }
    end

    def parse_reek(reek_output)
      reek_hash = YAML::load(clean_reek(reek_output))

      reek_hash.each do |hash|
        error = process_hash(hash)
        push_error(error)
      end

      return self
    end

    def clean_reek(reek_output)
      reek_output.gsub("- !ruby/object:Reek::SmellWarning","- smell_warning:")
    end

    def push_error(error)
      if self.result[ error.name.to_sym ]
        self.result[ error.name.to_sym ] << error
      else
        self.result[ error.name.to_sym ] = [ error ]
      end
    end

    def process_hash(hash)
      StyleStyle::Error.new( :name => get_error(hash),
                             :source => get_file(hash),
                             :line => get_lines(hash))
    end

    def get_error(hash)
      hash["smell"]["subclass"]
    end

    def get_file(hash)
      hash["location"]["source"]
    end

    def get_lines(hash)
      hash["location"]["lines"]
    end
  end
end
