require_relative 'pipeline'

module Reporting
  class Job
    include Pipeline

    def self.run(&block)
      new(@pipeline.dup, &block).run
    end

    def initialize(pipeline, &block)
      @pipeline = pipeline

      # Configure pipeline further on instance
      instance_eval(&block)
    end

    def run(context = {})
      pipeline = self

      job = Kiba.parse do
        pipeline.steps_for(:setup).each do |worker, args, block|
          pre_process Kiba::WorkerProxy.new(worker, context, &block), *args
        end

        pipeline.steps_for(:source).each do |worker, args, block|
          source Kiba::WorkerProxy.new(worker, context, Kiba::CollectionProxy, &block), *args
        end

        pipeline.steps_for(:transform).each do |worker, args, block|
          transform Kiba::WorkerProxy.new(worker, context, Kiba::TransformProxy, &block), *args
        end

        pipeline.steps_for(:destination).each do |worker, args, block|
          destination Kiba::WorkerProxy.new(worker, context, Kiba::CollectionProxy, &block), *args
        end

        pipeline.steps_for(:finalize).each do |worker, args, block|
          post_process Kiba::WorkerProxy.new(worker, context, &block), *args
        end
      end

      Kiba.run(job)
    end
  end
end
