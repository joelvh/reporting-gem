require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Transform
        include Steps

        def transform(worker = nil, **options, &block)
          add_step :transform, options, worker, &block
        end
      end
    end
  end
end
