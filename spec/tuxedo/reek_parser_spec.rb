require 'spec_helper'
require 'helpers/reek_output_helper'
include Tuxedo

describe "Reek parser" do
  describe "#parse_reek" do
    context "for a giant file" do
      let!(:output_1)     { generate_reek_output }
      let!(:reek_parser)  { Tuxedo::ReekParser.new }

      before(:all) do
        reek_parser.parse_reek(output_1)
        capture_stdout do
          Tuxedo::Outputter.print_to_screen(reek_parser.result)
        end
      end

      context "after parsing the output" do
        context "for TooManyStatements errors" do
          it "finds 1 error" do
            reek_parser.result[:"TooManyStatements"].count.should == 1
          end

          it "identifies the correct source of the error" do
            reek_parser.result[:"TooManyStatements"].first.source.should == "./app/controllers/addresses_controller.rb"
          end

          it "identifies the correct line number for the error" do
            reek_parser.result[:"TooManyStatements"].first.line.should == [ 2 ]
          end
        end

        context "for UncommunicativeVariableName errors" do
          it "finds 1 error" do
            reek_parser.result[:"UncommunicativeVariableName"].count.should == 1
          end

          it "identifies the correct source of the error" do
            reek_parser.result[:"UncommunicativeVariableName"].first.source.should == "./app/controllers/application_controller.rb"
          end

          it "identifies the correct line number for the error" do
            reek_parser.result[:"UncommunicativeVariableName"].first.line.should == [ 34 ]
          end
        end
      end
    end
  end
end
