require_relative '../../step'

module Reporting
  module DSL
    module Pipeline
      module Steps
        def add_step(step, worker, args, &block)
          (@steps ||= {})[step] ||= [worker || Reporting::Step, args, block]

          self
        end

        def steps_for(step)
          (@steps ||= {})[step] ||= []
        end
      end
    end
  end
end
