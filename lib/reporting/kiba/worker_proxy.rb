module Reporting
  module Kiba
    class WorkerProxy
      def initialize(worker, context, pipeline, proxy = Proc, &block)
        @worker   = worker
        @context  = context
        @pipeline = pipeline
        @proxy    = proxy
        @block    = block
      end

      # Instance method to simulate class
      def new(*constructor_args)
        @proxy.new do |*call_args|
          @worker.new(constructor_args, @pipeline, &@block).call(*call_args, @context)
        end
      end
    end
  end
end
