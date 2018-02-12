module Reporting
  module Kiba
    class WorkerProxy
      def initialize(worker, context, pipeline, proxy = nil, &block)
        @worker   = worker
        @context  = context
        @pipeline = pipeline
        # Kiba calls `call` for processors
        # and `each` for sources/destinations
        # and `process` for transforms
        @proxy    = proxy || Proc
        @block    = ProcBinder.proxy(@pipeline, &block)
      end

      # Instance method to simulate class
      def new(*constructor_args)
        @proxy.new do |*call_args|
          @worker.new(constructor_args, @pipeline, &@block).call(call_args, @context)
        end
      end
    end
  end
end
