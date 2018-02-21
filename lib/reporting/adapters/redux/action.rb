module Reporting
  module Adapters
    module Redux
      class Action < Hash
        attr_reader :type

        def initialize(type, default_object, &default_builder)
          super(default_object, &default_builder)

          @type = type
        end
      end
    end
  end
end
