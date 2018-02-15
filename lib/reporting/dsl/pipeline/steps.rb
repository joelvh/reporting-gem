require_relative '../../step'

module Reporting
  module DSL
    module Pipeline
      module Steps
        def add_step(step, name, options, worker = nil, &block)
          (@steps ||= {})[step] ||= {
            name:    name,
            options: options,
            worker:  worker || Reporting::Step,
            block:   block
          }

          self
        end

        def steps_for(step)
          (@steps ||= {})[step] ||= {}
        end
      end
    end
  end
end
