module Reporting
  module Kiba
    class CollectionProxy
      def initialize(&block)
        @block = block
      end
      
      def each(&block)
        @block.call(&block)
      end
    end
  end
end
