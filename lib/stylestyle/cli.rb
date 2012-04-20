module StyleStyle
  module Cli extend self
    class CliResult < Struct.new(:stdout, :stderr, :exit_status)
      def exit_code
        exit_status.exitstatus
      end
    end

    def sh(cmd)
      Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
        pid = wait_thr.pid # pid of the started process.
        exit_status = wait_thr.value

        CliResult.new(stdout.read, stderr.read, exit_status)
      end
    end
  end
end
