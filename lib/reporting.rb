require 'reporting/version'

module Reporting
  singleton_class.instance_eval do
    # Configuration options
    attr_accessor :default_job_class

    def configure
      block_given? ? yield(self) : self
    end
  end

  require_relative 'adapters/kiba/job'
  self.default_job_class = Adapters::Kiba::Job
end
