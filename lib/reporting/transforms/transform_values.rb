module Reporting
  module Transforms
    class TransformValues < TransformHash
      def transform_value(key, value)
        @block ? @block.call(value) : value
      end

      def slice?(key, value)
        !block? && !match?(value)
      end
    end
  end
end
