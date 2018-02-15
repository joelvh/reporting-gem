module Reporting
  module Pipeline
    module Transforms
      class TransformValues < TransformHash
        def transform_value(key, value)
          apply_block(value)
        end

        def slice?(key, value)
          !block? && !match?(value)
        end
      end
    end
  end
end
