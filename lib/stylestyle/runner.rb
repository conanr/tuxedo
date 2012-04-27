require 'cane'
require 'cane/cli'

require 'stylestyle/tty'
require 'stylestyle/cli'
require 'stylestyle/cane_violation'

module StyleStyle
  module Runner
    class << self
      def run_cane(cane_opts=nil)
        cane_opts ||= "--style-glob **/*.rb".split
        opts = Cane::CLI::Spec.new.parse(cane_opts)
        runner = Cane::Runner.new(opts)
        def runner.outputter;
          @outputter ||= StringIO.new
        end
        runner.run
        violations = runner.send(:violations)
        violations.map { |v| CaneViolation.from_cane(v)}
      end

      def run_reek
        reek_result = Cli.sh("reek -qy .")

        if reek_failed?(reek_result)
          if need_mvz_reek?(reek_result.stderr)
            print_use_mvz_reek
          else
            print_reek_failed
            puts reek_result.stderr
          end
        end

        reek_result.stdout
      end

      private

      def reek_failed?(result)
        !result.stderr.empty?
      end

      def need_mvz_reek?(stderr)
        RUBY_VERSION >= '1.9.2' &&
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
