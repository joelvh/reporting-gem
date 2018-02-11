module Reporting
  module Kiba
    class CollectionProxy
      def initialize(&block)
        @block = block
      end
      
      def each(&block)
        @block.call.each(&block)
      end
    end
  end
end
