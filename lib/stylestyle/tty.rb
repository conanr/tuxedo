module StyleStyle
  module Tty extend self
    class << self
      def color_enabled?
        @color_enabled
      end

      # Generates color methods.
      #
      # Fore each generated method:
      #   When called without an argument:
      #     Returns the terminal escape code.
      #   When called with an argument:
      #     Returns the argument#to_s, wrapped in both
      #     the color escape code and reset escape code.
      #
      # Examples:
      #   red          #=> "\e[31m"
      #   red("Blah")  #=> "\e[31mBlah\e[0m"
      def def_color(name, code)
        class_eval <<-CODE, __FILE__, __LINE__ + 1
          def #{name}(text=(default_arg=true;nil))
            if Tty.color_enabled?
              if default_arg
                "#{escape(code)}"
              else
                "#{escape(code)}\#{text}#{escape(0)}"
              end
            else
              text.to_s
            end
          end
        CODE
      end

      private

      def color_enabled=(true_or_false)
        @color_enabled = true_or_false
      end
    end

    self.color_enabled = true

    def escape(code)
      "\033[#{code}m" if Tty.color_enabled?
    end

    def_color :reset,     0
    def_color :bold,      1
    def_color :invert,    3
    def_color :underline, 4
    def_color :red,       31
    def_color :green,     32
    def_color :yellow,    33
    def_color :blue,      34
    def_color :magenta,   35
    def_color :cyan,      36
    def_color :white,     37

    def with_color(true_or_false=true)
      old_color_enabled = Tty.color_enabled?
      Tty.send(:color_enabled=, true_or_false)
      yield
    ensure
      Tty.send(:color_enabled=, old_color_enabled)
    end

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
