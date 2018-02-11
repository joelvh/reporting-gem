require_relative '../../step'

module Reporting
  module DSL
    module Pipeline
      module Steps
        def add_step(step, options, worker = nil, &block)
          (@steps ||= {})[step] ||= [options, worker || Reporting::Step, block]

          self
        end

        def steps_for(step)
          (@steps ||= {})[step] ||= []
        end
      end
    end
  end
end
