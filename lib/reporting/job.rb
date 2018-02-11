require 'kiba'
require_relative 'pipeline'
require_relative 'kiba/worker_proxy'
require_relative 'kiba/collection_proxy'
require_relative 'kiba/transform_proxy'

module Reporting
  class Job
    include Pipeline

    # Entry point to run a job.
    # Initiates a default job class if
    # called on Job and not subclassed.
    def self.perform(context = {}, &block)
      # Use a default job class if this class
      # is not a subclass of Job
      klass = ::Reporting.default_job_class if self == Job
      klass ||= self

      # Grab @pipeline from class and copy it to instance
      klass.new(@pipeline.dup, &block).perform(context)
    end

    # private_class_method :new

    def initialize(pipeline, &block)
      @pipeline = pipeline

      # Configure pipeline further on instance
      instance_eval(&block)
    end

    def perform(context = {})
      raise "Instance method #{self.class}#perform must be implemented"
    end
  end
end
