$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless
  $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

require 'yaml'
require 'Open3'
require 'tuxedo/outputter'
require 'tuxedo/cane_parser'
require 'tuxedo/reek_parser'
require 'tuxedo/error'
require 'tuxedo/runner'
require 'tuxedo/tty'
require 'tuxedo/formatters/cane_text_formatter'

module Tuxedo
  def self.output_to_console
    cane_violations = Runner.run_cane
    formatter = Formatters::CaneTextFormatter.new($stdout)
    formatter.format(cane_violations)
    puts ""

    rp = Tuxedo::ReekParser.new
    reek_output = Tuxedo::Runner.run_reek
    rp.parse_reek(reek_output)
    Tuxedo::Outputter.print_to_screen(rp.result) if rp.result.is_a? Hash
  end
end
