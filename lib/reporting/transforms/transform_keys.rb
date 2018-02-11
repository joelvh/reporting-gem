module Reporting
  module Transforms
    class TransformKeys < TransformHash
      def transform_key(key, value)
        apply_block(key)
      end

      def slice?(key, value)
        !block? && !match?(key)
      end
    end
  end
end
