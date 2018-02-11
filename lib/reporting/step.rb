module Reporting
  class Step
    def initialize(*args, &block)
      @args    = args
      @block   = block
    end

    def call(row, context)
      raise "Not implemented"
    end

  protected

    def block?
      !@block.nil?
    end
  end
end
