require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Setup
        include Steps

        def setup(worker = nil, **options, &block)
          add_step :setup, options, worker, &block
        end
      end
    end
  end
end
