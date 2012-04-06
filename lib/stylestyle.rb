$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))
  
require 'yaml'
require 'stylestyle/reek_parser'

module StyleStyle
  class Runner
    def self.run_cane
      output = `cane`
    end
    def self.run_reek
      # "reek . 2>&1"
      output = `reek -qy .`
      StyleStyle::ReekParser.parse_reek(output)
    end
  end
end