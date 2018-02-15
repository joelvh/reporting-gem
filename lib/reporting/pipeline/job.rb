require 'kiba'
require_relative 'pipeline'
require_relative 'kiba/worker_proxy'
require_relative 'kiba/collection_proxy'
require_relative 'kiba/transform_proxy'

module Reporting
  module Pipeline
    class Job
      # Entry point to run a job.
      def self.perform(context = {}, &block)
        raise "Include #{self.name} in a class" unless Class === self

        # Grab @steps from class and copy it to instance
        new(@steps.dup, &block).perform(context)
      end

      # private_class_method :new

      def initialize(steps, &block)
        @steps = steps

        # Configure job further on instance
        instance_exec(self, &block)
      end

      def perform(context = {})
        raise "Instance method #{self.class}#perform must be implemented"
      end
    end
  end
end
