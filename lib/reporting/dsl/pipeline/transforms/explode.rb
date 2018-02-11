require_relative '../../../transforms/explode_enumerable'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module Explode
          def explode(**options)
            transform Reporting::Transforms::ExplodeEnumerable, **options
          end
        end
      end
    end
  end
end
