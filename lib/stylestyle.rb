module StyleStyle
  class Runner
    def self.run_cane
      output = system "cane"
    end
    def self.run_reek
      # "reek . 2>&1"
      output = system "reek -qy ." 
    end
  end
end