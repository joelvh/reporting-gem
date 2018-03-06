require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Destination
        include Steps

        def destination(worker = nil, name:, **options, &block)
          add_step :destination, name, options, worker, &block
        end
      end
    end
  end
end
