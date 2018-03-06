require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Source
        include Steps

        def source(worker = nil, name:, **options, &block)
          add_step :source, name, options, worker, &block
        end
      end
    end
  end
end
