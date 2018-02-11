module Reporting
  class ProcBinder < BasicObject
    def self.bind(target, &block)
      new(target, block.binding).bind(&block)
    end

    def initialize(target, outer_binding)
      @target, @outer_binding = target, outer_binding
    end

    def bind(&block)
      instance_eval(&block)
    end
  
    def outer_self
      @outer_binding.eval('self')
    end
  
    def method_missing(method, *args, &block)
      # methods in dsl object are called in preference to self outside the block
      if @target.respond_to? method
        # dsl method, so call it
        @target.send method, *args, &block
      else
        outer_self.send method, *args, &block
      end
    end
  
    def respond_to_missing?(method, _)
      outer_self.respond_to?(method) || @target.respond_to?(method)
    end
  end
end
