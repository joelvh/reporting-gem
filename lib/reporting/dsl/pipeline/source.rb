require_relative 'steps'

module Reporting
  module DSL
    module Pipeline
      module Source
        include Steps

        def source(worker = nil, *args, &block)
          add_step :source, worker, args, &block
        end
      end
    end
  end
end
