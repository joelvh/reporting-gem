module Reporting
  module Adapters
    module Redux
      # See: https://medium.com/cloudaper/understanding-redux-store-concepts-by-little-ruby-reimplementation-d08bcc05dee8
      class Store
        attr_reader :state

        def initialize(reducer, initial_state = nil)
          @reducer = reducer
          @listeners = []
          @state = initial_state
          dispatch({})
        end

        def dispatch(action)
          @state = @reducer.call(@state, action)
          @listeners.each(&:call)
        end

        def subscribe(listener2 = nil, &listener)
          listener ||= listener2

          @listeners.push(listener)

          -> { @listeners.delete(listener) }
        end

        # keywords represent keys in state hash
        def self.combine_reducers(**reducers)
          -> (state, action) {
            state ||= {}

            reducers.each_with_object({}) do |(key, reducer), next_state|
              next_state[key] = reducer.call(state[key], action)
            end
          }
        end
      end
    end
  end
end
