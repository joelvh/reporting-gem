require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Destination
        include Steps

        def destination(worker = nil, *args, &block)
          add_step :destination, worker, args, &block
        end
      end
    end
  end
end
