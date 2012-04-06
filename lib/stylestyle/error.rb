module StyleStyle
  class Error
    attr_accessor :name, :source, :line

    def initialize(params)
      self.name = params[:name]
      self.source = params[:source]
      self.line = params[:line]
    end

    def print
      "#{self.source} #{self.line}"
    end
  end
end