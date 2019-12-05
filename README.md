## TrackUnit Ruby

[![Build Status](https://travis-ci.com/HassanAkbar/trackunit.svg?branch=master)](https://travis-ci.com/HassanAkbar/trackunit)

This library is designed to help ruby/rails based applications communicate with the publicly available REST API for Trackunit.


If you are unfamiliar with the Trackunit REST API, you should first read the documentation located at https://dev.trackunit.com/.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'trackunit'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install trackunit

## Basic Usage
```ruby
require 'rubygems'
require 'trackunit'

# Create client (used to communicate with the API).
client = TrackUnit::Client.new(YOUR_TRACKUNIT_TOKEN)

# Retrieve list of Units (note: all communication must be made through the client).
units = client.units
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/HassanAkbar/trackunit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Trackunit project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/HassanAkbar/trackunit/blob/master/CODE_OF_CONDUCT.md).
