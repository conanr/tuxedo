require 'stylestyle/tty'
require 'stylestyle/cli'

module StyleStyle
  module Runner
    class << self
      include Tty

      def run_cane(path="**")
        output = `cane --style-glob #{path}/*.rb`
      end

      def run_reek
        reek_result = Cli.sh("reek -qy .")

        if reek_result.exit_code != 0
          if needs_mvz_reek(reek_result.stderr)
            print_use_mvz_reek
          else
            print_reek_failed
            puts reek_result.stderr
          end
        end

        reek_result.stdout
      end

      private

      def needs_mvz_reek(stderr)
        RUBY_VERSION == '1.9.2' &&
          stderr.index("Error: undefined method `sexp_type'")
      end

      def print_use_mvz_reek
            puts <<-MSG
Oh snap! Reek has a problem on 1.9.3.
Try putting this in your gemfile instead:

  gem 'reek', :git => "git://github.com/mvz/reek.git", :branch => "ripper_ruby_parser-2"

MSG
      end

      def print_reek_failed
        puts "Oh snap! Reek ran into a problem:"
      end
    end
  end
end
