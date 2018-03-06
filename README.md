# Reporting

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/reporting`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'reporting'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install reporting

## Usage

TODO: Coming Soon

## Resource

### Redux

[Redux](https://redux.js.org/) is a predictable state container for JavaScript apps. You can use Redux together with [React](https://reactjs.org/), or with any other view library.

The design pattern is pretty simple. We have an implementation ([./lib/reporting/adapters/redux/](adapters/redux)) and there are several others to consider.

* [Grand Central](https://github.com/clearwater-rb/grand_central) - GrandCentral is based on ideas similar to Redux. You have a central store that holds all your state. This state is updated via a handler block when you dispatch actions to the store.
* [Understanding Redux store concepts by little Ruby reimplementation](https://medium.com/cloudaper/understanding-redux-store-concepts-by-little-ruby-reimplementation-d08bcc05dee8) - this inspired our implementation ([./lib/reporting/adapters/redux/](adapters/redux))

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelvh/reporting.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
