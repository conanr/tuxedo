$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))
  
require 'yaml'
require 'stylestyle/outputter'
require 'stylestyle/cane_parser'
require 'stylestyle/reek_parser'
require 'stylestyle/error'
require 'stylestyle/runner'

module StyleStyle
  def output_to_console
    parsed_cane_output = StyleStyle::CaneParser.parse_cane(StyleStyle::Runner.run_cane)
    formatted_cane_output = StyleStyle::Outputter.format_cane_output
  end
end