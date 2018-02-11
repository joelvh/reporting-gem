module Reporting
  class Step
    def initialize(*args, **options, &block)
      @args    = args
      @options = options
      @block   = block
    end

    def call(*args, **options, &block)
      raise "Not implemented"
    end

    # Kiba compatibility
    alias_method :process, :call

  protected

    def block?
      !@block.nil?
    end
  end
end
