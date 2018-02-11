require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Transform
        include Steps

        def transform(worker = nil, *args, &block)
          add_step :transform, worker, args, &block
        end
      end
    end
  end
end
