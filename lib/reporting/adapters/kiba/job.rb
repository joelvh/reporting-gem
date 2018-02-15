require 'kiba'
require_relative 'pipeline'
require_relative 'kiba/worker_proxy'
require_relative 'kiba/collection_proxy'
require_relative 'kiba/transform_proxy'

module Reporting
  module Adapters
    module Kiba
      class Job
        include Reporting::Job

        def perform(context = {})
          # Prepare Kiba pipeline args before switching
          # binding context in `Kiba.parse`
          phases = {
            pre_process:  build_args(:setup,       context),
            source:       build_args(:source,      context, Kiba::CollectionProxy),
            transform:    build_args(:transform,   context, Kiba::TransformProxy),
            destination:  build_args(:destination, context, Kiba::CollectionProxy),
            post_process: build_args(:finalize)
          }

          job = build do |config|
            phases.each do |phase, steps|
              steps.each { |args| config.send(phase, *args) }
            end
          end

          Kiba.run(job)
        end

      protected

        def build
          Kiba.parse{ yield self }
        end

        def build_args(step, context, proxy_class = nil)
          steps_for(step).map do |config|
            [
              Kiba::WorkerProxy.new(
                config.fetch(:worker),
                context,
                self,
                proxy_class,
                &config.fetch(:block)
              ),
              config.fetch(:options)
            ]
          end
        end
      end
    end
  end
end
