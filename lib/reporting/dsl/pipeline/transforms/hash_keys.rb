require_relative '../../../transforms/transform_keys'

module Reporting
  module DSL
    module Pipeline
      module Transforms
        module HashKeys
          def symbolize_keys(*specific_keys, **options)
            transform_keys(*specific_keys, **options, &:to_sym)
          end

          def stringify_keys(*specific_keys, **options)
            transform_keys(*specific_keys, **options, &:to_s)
          end

          def slice_keys(*specific_keys, **options)
            transform_keys(*specific_keys, **options)
          end

          # - Block formats the keys
          # - No block means we "slice" the hash (if matchers are specified)
          def transform_keys(*matchers, **options, &block)
            transform Reporting::Transforms::TransformKeys, matchers: matchers, **options, &block
          end
        end
      end
    end
  end
end
