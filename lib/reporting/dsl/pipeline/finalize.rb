require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Finalize
        include Steps

        def finalize(worker = nil, *args, &block)
          add_step :finalize, worker, args, &block
        end
      end
    end
  end
end
