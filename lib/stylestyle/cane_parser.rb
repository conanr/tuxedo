module StyleStyle
  class CaneParser
    def parse_cane(output)
      # read the output line by line
      result = []
      output.split("\n").each do |line|
        if has_error?(line)
          line_result = {}
          line_result[:error] = get_error(line)
          line_result[:file] = get_file(line)
          line_result[:line_number] = get_line_number(line)
          result << line_result
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