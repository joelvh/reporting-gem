module Reporting
  module Kiba
    class TransformProxy
      def initialize(&block)
        @block = block
      end
      
      def process(row)
        @block.call(row)
      end
    end
  end
end
