require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Finalize
        include Steps

        def finalize(worker = nil, name:, **options, &block)
          add_step :finalize, name, options, worker, &block
        end
      end
    end
  end
end
