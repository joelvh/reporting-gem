module Reporting
  module Enumerator
    class << self
      def build(&append_to)
        ::Enumerator.new do |yielder|
          yield yielder
        end
      end

      def call
        ::Enumerator.new do |yielder|
          append_to yielder
        end
      end

      # Implement `append_to` to simply add elements.
      def append_to(collection)
        raise "#{self.name}#append_to not implemented"
      end
    end
  end
end
