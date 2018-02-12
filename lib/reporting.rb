require 'reporting/version'

module Reporting
  singleton_class.instance_eval do
    # Configuration options
    # attr_accessor ...

    def configure
      block_given? ? yield(self) : self
    end
  end
end
