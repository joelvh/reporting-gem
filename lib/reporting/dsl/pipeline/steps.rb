require_relative '../../step'

module Reporting
  module DSL
    module Pipeline
      module Steps
        def add_step(type, name, options, worker = nil, &block)
          (@steps ||= {})[type] ||= {
            name:    name,
            options: options,
            worker:  worker || Reporting::Step,
            block:   block
          }

          self
        end

        def steps_for(type)
          (@steps ||= {})[type] ||= {}
        end
      end
    end
  end
end
