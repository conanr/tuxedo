module StyleStyle
  class Outputter
    def self.print_to_screen(error_collection)
      #errors will be hash of errors

      error_collection.each do |error_type, errors|
        puts error_type
        puts "------------------------------------"
        errors.each do |error|
          puts error.print
        end
        puts
      end
    end
  end
end