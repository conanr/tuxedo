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
                             :line => get_line(line))
    end

    def has_error?(line)
      line.include?("Line is >80 characters") || line.include?("Line contains trailing whitespaces")
    end
    
    def get_error(line)
      if line.include?("Line is >80 characters")
        error = "Line is >80 characters"
      elsif line.include?("Line contains trailing whitespaces")
        error = "Line contains trailing whitespaces"
      else
        error = "Unknown error"
      end
      error
    end
    
    def get_file(line)
      line.match(/([a-zA-Z0-9.\/]+):/)[0]
    end
    
    def get_line(line)
      line.match(/:(\d+)/)[0]
    end
  end
end