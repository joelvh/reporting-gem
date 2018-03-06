require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Transform
        include Steps

        def transform(worker = nil, name:, **options, &block)
          add_step :transform, name, options, worker, &block
        end
      end
    end
  end
end
