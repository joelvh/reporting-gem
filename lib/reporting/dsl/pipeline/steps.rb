require_relative '../../step'

module Reporting
  module DSL
    module Pipeline
      module Steps
        def add_step(step, options, worker = nil, &block)
          (@pipeline ||= {})[step] ||= [options, worker || Reporting::Step, block]

          self
        end

        def steps_for(step)
          (@pipeline ||= {})[step] ||= []
        end
      end
    end
  end
end
