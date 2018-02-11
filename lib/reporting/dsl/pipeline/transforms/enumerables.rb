require_relative 'explode'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module Enumerables
          include Explode
        end
      end
    end
  end
end
