require_relative '../../../transforms/transform_keys'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module HashKeys
          def symbolize_keys(*specific_keys)
            transform_keys(*specific_keys, &:to_sym)
          end

          def stringify_keys(*specific_keys)
            transform_keys(*specific_keys, &:to_s)
          end

          def slice_keys(*specific_keys)
            transform_keys(*specific_keys)
          end

          # - Block formats the keys
          # - No block means we "slice" the hash (if matchers are specified)
          def transform_keys(*matchers, &block)
            transform Reporting::Transforms::TransformKeys, *matchers, &block
          end
        end
      end
    end
  end
end
