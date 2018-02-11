require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Setup
        include Steps

        def setup(worker = nil, *args, &block)
          add_step :setup, worker, args, &block
        end
      end
    end
  end
end
