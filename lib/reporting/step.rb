module Reporting
  class Step
    def initialize(options, pipeline, &block)
      @options  = options
      @pipeline = pipeline
      @block    = block
    end

    def call(args, context)
      apply_block(args, context)
    end

  protected

    def apply_block(args, context)
      return args[0] unless block?

      @pipeline.instance_exec(args, context, &@block)
    end

    def block?
      !@block.nil?
    end
  end
end
