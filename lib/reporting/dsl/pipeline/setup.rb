require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Setup
        include Steps

        def setup(worker = nil, name:, **options, &block)
          add_step :setup, name, options, worker, &block
        end
      end
    end
  end
end
