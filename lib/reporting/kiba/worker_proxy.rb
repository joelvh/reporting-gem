module Reporting
  module Kiba
    class WorkerProxy
      def initialize(worker, context, proxy = Proc, &block)
        @worker  = worker
        @context = context
        @proxy   = proxy
        @block   = block
      end

      # Instance method to simulate class
      def new(*args)
        @proxy.new do |row|
          @worker.new(args, &@block).call(row, @context)
        end
      end
    end
  end
end
