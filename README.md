# ActiveRecord::Explainer

This gem automatically logs `SQL EXPLAIN` of every queries.

You can check naturally every `SQL EXPLAIN` from development log, without :hand: executions.

## Usage

If you use Rails, it's no configuration, and you can logs SQL EXPLAIN of every queries.

![](https://github.com/yhirano55/activerecord-explainer/blob/master/images/v0.2.0.png?raw=true)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-explainer', group: :development
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-explainer

## How it work?

- This gem subscribes `sql.active_record` event provided by the [Active Support instrumentation API](https://guides.rubyonrails.org/active_support_instrumentation.html).
- Subscriber handles payload, and execute EXPLAIN from `ActiveRecord::Base`.

Please check the [implementation](https://github.com/yhirano55/activerecord-explainer/blob/master/lib/activerecord/explainer/subscriber.rb), if you interested in.

## License

[MIT License](https://opensource.org/licenses/MIT)
