module Reporting
  module Kiba
    class WorkerProxy
      def initialize(worker, context, job, proxy = nil, &block)
        @worker   = worker
        @context  = context
        @job = job
        # Kiba calls `call` for processors
        # and `each` for sources/destinations
        # and `process` for transforms
        @proxy    = proxy || Proc
        @block    = ProcBinder.proxy(@job, &block)
      end

      # Instance method to simulate class
      def new(*constructor_args)
        @proxy.new do |*call_args|
          @worker.new(constructor_args, @job, &@block).call(call_args, @context)
        end
      end
    end
  end
end
