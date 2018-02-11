module Reporting
  class Step
    def initialize(options, pipeline, &block)
      @options  = options
      @pipeline = pipeline
      @block    = block
    end

    def call(row, context)
      apply_block(row, context)
    end

  protected

    def apply_block(*args, &block)
      return args.first unless @block

      body = @block
      @pipeline.instance_eval { body.call(*args, &block) }
    end

    def block?
      !@block.nil?
    end
  end
end
