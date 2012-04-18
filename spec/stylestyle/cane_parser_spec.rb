require 'spec_helper'
require 'helpers/cane_output_helper'
include StyleStyle

describe "cane parser" do
  describe "#parse_cane" do
    context "for a single line length and whitespace error" do
      let!(:output_1)     { generate_cane_output }
      let!(:cane_parser)  { StyleStyle::CaneParser.new }

      before(:all) do
        cane_parser.parse_cane(output_1)
        StyleStyle::Outputter.print_to_screen(cane_parser.result)
      end
      
      context "after parsing the output" do
        it "finds 1 whitespace error" do
          cane_parser.result[:"Line contains trailing whitespaces"].count.should == 1
        end

        it "identifies the correct source of the whitespace error" do
          cane_parser.result[:"Line contains trailing whitespaces"].first.source.should == "app/controllers/carts_controller.rb"
        end

        it "identifies the correct line number for the whitespace error" do
          cane_parser.result[:"Line contains trailing whitespaces"].first.line.should == [ "4" ]
        end

        it "finds 1 line length error" do
          cane_parser.result[:"Line is >80 characters"].count.should == 1
        end

        it "identifies the correct source of the length error" do
          cane_parser.result[:"Line is >80 characters"].first.source.should == "app/controllers/products_controller.rb"
        end

        it "identifies the correct line number for the length error" do
          cane_parser.result[:"Line is >80 characters"].first.line.should == [ "47" ]
        end
      end
    end
  end
end