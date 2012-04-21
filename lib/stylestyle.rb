$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require 'yaml'
require 'stylestyle/outputter'
require 'stylestyle/cane_parser'
require 'stylestyle/reek_parser'
require 'stylestyle/error'
require 'stylestyle/runner'
require 'stylestyle/tty'
require 'stylestyle/formatters/cane_text_formatter'

module StyleStyle
  def self.output_to_console
    cane_violations = Runner.run_cane
    formatter = Formatters::CaneTextFormatter.new($stdout)
    formatter.format(cane_violations)
    puts ""

    rp = StyleStyle::ReekParser.new
    reek_output = StyleStyle::Runner.run_reek
    rp.parse_reek(reek_output)
    StyleStyle::Outputter.print_to_screen(rp.result) if rp.result.is_a? Hash
  end
end
