module StyleStyle
  class CaneParser
    attr_accessor :result

    def initialize
      self.result = { }
    end

    def parse_cane(output)
      output.split("\n").each do |line|
        if has_error?(line)
          error = process_line(line)
          push_error(error)
        end
      end
      return self
    end

    def push_error(error)
      if self.result[ error.name.to_sym ]
        self.result[ error.name.to_sym ] << error
      else
        self.result[ error.name.to_sym ] = [ error ]
      end
    end

    def process_line(line)
      StyleStyle::Error.new( :name => get_error(line),
                             :source => get_file(line),
                             :line => get_lines(line))
    end

    def has_error?(line)
      line.include?(">") || line.include?("Line contains trailing whitespaces")
    end

    def get_error(line)
      if line.include?("Line is >80 characters")
        error = "Line is >80 characters"
      elsif line.include?("Line contains trailing whitespaces")
        error = "Line contains trailing whitespaces"
      elsif line.include?(">") # abc complexity errors have a > char too
        error = "Maximum allowed ABC complexity"
      end
      error
    end

    def get_file(line)
      if line.include?(":")
        line.match(/([a-zA-Z0-9.\/_]+):/)[1]
      else
        line.split(" ").first
      end
    end

    def get_lines(line)
      if line.include?(":")
        [ line.match(/:(\d+)/)[1] ]
      else
        [ line.split(" ").last ]
      end
    end
  end
end
