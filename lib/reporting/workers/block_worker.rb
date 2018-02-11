module Reporting
  module Workers
    class BlockWorker < Worker
      def initialize(args, &block)
        @args  = args
        @block = block
      end
    end
  end
end
