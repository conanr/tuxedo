require 'spec_helper'
require 'helpers/cane_output_helper'
include StyleStyle

describe "Reek parser" do
  describe "#parse_reek" do
    context "for a giant file" do
      let!(:output_1)     { generate_full_reek_output }
      let!(:reek_parser)  { StyleStyle::ReekParser.new }

      before(:all) do
        reek_parser.parse_reek(output_1)
        StyleStyle::Outputter.print_to_screen(reek_parser.result)
      end

      context "after parsing the output" do
        it "finds 1 whitespace error" do
          # raise @reek_output.inspect
        end
      end
    end
  end
end
