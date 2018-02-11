require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Finalize
        include Steps

        def finalize(worker = nil, **options, &block)
          add_step :finalize, options, worker, &block
        end
      end
    end
  end
end
