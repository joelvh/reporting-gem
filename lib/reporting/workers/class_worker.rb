module Reporting
  module Workers
    class ClassWorker < Worker
      def initialize(worker_class, args)
        @args  = args
        @worker_class = worker_class
      end
    end
  end
end
