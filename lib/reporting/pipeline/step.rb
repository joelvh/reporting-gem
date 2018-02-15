module Reporting
  module Pipeline
    class Step
      include DSL

      def initialize(options, job, &block)
        @options = options
        @job     = job
        @block   = block
      end

      def call(args, context)
        apply_block(args, context)
      end

    protected

      def apply_block(args, context)
        return args[0] unless block?

        @job.instance_exec(args, context, &@block)
      end

      def block?
        !@block.nil?
      end
    end
  end
end
