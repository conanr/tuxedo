module StyleStyle
  module Tty extend self
    def capture_stdout
      out = StringIO.new
      $stdout = out
      yield
      return out
    ensure
      $stdout = STDOUT
    end

    def capture_stderr
      out = StringIO.new
      $stderr = out
      yield
      return out
    ensure
      $stderr = STDERR
    end

    def terminal_size_available?
      !!terminal_size
    end

    # Returns [width, height] of terminal when detected, nil if not detected.
    # Think of this as a simpler version of Highline's Highline::SystemExtensions.terminal_size()
    # https://github.com/cldwalker/hirb/blob/0df53628bd07845feed43030477b65106e75c7dd/lib/hirb/util.rb#L55-73
    def terminal_size
      if (ENV['COLUMNS'] =~ /^\d+$/) && (ENV['LINES'] =~ /^\d+$/)
        [ENV['COLUMNS'].to_i, ENV['LINES'].to_i]
      elsif (RUBY_PLATFORM =~ /java/ || (!STDIN.tty? && ENV['TERM'])) && command_exists?('tput')
        [`tput cols`.to_i, `tput lines`.to_i]
      elsif STDIN.tty? && command_exists?('stty')
        `stty size`.scan(/\d+/).map { |s| s.to_i }.reverse
      else
        nil
      end
    rescue
      nil
    end

    private

    # Determines if a shell command exists by searching for it in ENV['PATH'].
    def command_exists?(command)
      ENV['PATH'].split(File::PATH_SEPARATOR).any? {|d| File.exists? File.join(d, command) }
    end
  end
end
