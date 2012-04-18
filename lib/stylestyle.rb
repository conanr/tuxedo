$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))
  
require 'yaml'
require 'stylestyle/outputter'
require 'stylestyle/cane_parser'
require 'stylestyle/reek_parser'
require 'stylestyle/error'
require 'stylestyle/runner'

module StyleStyle
  def self.output_to_console
    #parsed_cane_output is hash where keys are errors and values are error objects
    # cp = StyleStyle::CaneParser.new
    # cane_output = StyleStyle::Runner.run_cane
    # cp.parse_cane(cane_output)
    # StyleStyle::Outputter.print_to_screen(cp.result)

    rp = StyleStyle::ReekParser.new
    reek_output = StyleStyle::Runner.run_reek
    rp.parse_reek(reek_output)
    StyleStyle::Outputter.print_to_screen(rp.result)

  end
end