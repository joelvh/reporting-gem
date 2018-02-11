require_relative '../../../transforms/transform_values'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module HashValues
          def symbolize_values(*specific_values)
            transform_keys(*specific_values, &:to_sym)
          end

          def stringify_values(*specific_values)
            transform_values(*specific_values, &:to_s)
          end

          # - Block formats the keys
          # - No block means we "slice" the hash
          def transform_values(*matchers, &block)
            transform Reporting::Transforms::TransformValues, *matchers, &block
          end
        end
      end
    end
  end
end
