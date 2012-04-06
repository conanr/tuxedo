module StyleStyle
  class CaneParser
    def parse_cane(output)
      result = Hash.new([])
      output.split("\n").each do |line|
        if has_error?(line)
          c = StyleStyle::CaneError.create(:error => get_error(line), 
                                           :file => get_file(line), 
                                           :line_number => get_line_number(line))
          
          result[ get_error(line).to_sym ] << c
        end
      end
      result
    end
    
    def has_error?(line)
      line.include?("Line is >80 characters") || line.include?("Line contains trailing whitespaces")
    end
    
    def get_error(line)
      
    end
    
    def get_file(line)
    end
    
    def get_line_number(line)
    end
  end
end