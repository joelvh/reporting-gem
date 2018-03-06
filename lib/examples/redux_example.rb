require_relative '../reporting/adapters/redux'

counter_reducer = -> (state, action) {
  state ||= 0

  case action.type
  when 'increment'
    state += 1
  when 'decrement'
    state -= 1
  else
    state
  end
}

counter.call(2, type: 'increment')
# => 3
counter.call(nil, type: 'decrement')
# => -1


counter_listener = -> () { puts 'I am counting numbers' }

my_counter_store = Reporting::Adapters::Redux::Store.new(counter_reducer)
my_counter_store.subscribe(counter_listener)

my_counter_store.dispatch(type: 'increment')
# => I am counting numbers
my_counter_store.dispatch(type: 'decrement')
# => I am counting numbers
puts "Counter is #{my_counter_store.current_state}"
# => Counter is 3