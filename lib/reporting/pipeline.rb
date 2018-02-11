require_relative 'dsl/pipeline'
require_relative 'dsl/pipeline/transforms'

module Reporting
  module Pipeline
    include DSL::Pipeline
    include DSL::Pipeline::Transforms

      # def build_worker(step, args, &block)
      #   return BlockWorker.new(args, &block) if block_given?
        
      #   worker = args.shift

      #   case worker
      #   when Class
      #     ClassWorker.new(worker, args)
      #   else
      #     raise "Specify a worker class or block"
      #   end
      # end
  end
end
