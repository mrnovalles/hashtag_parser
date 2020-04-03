# HashtagParser

[![Build Status](https://travis-ci.org/zucaritask/hashtag_parser.svg?branch=master)](https://travis-ci.org/zucaritask/hashtag_parser)

A hashtag parser that brings the behavior of `hashtag-rs` to ruby.

This project is a direct port of the above mentioned using ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hashtag_parser'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hashtag_parser

## Usage

```ruby
hashtags = HashtagParser.pase("#ruby is #awesome")
```

`hashtags` is going to be:

```
[
  {
    text: "ruby",
    start: 0,
    end: 4
  },
  {
    text: "awesome",
    start: 9,
    end: 16
  }
]
```
## Contact 

Twitter: [@zucaritask](http://twitter.com/zucaritask)
Github: [@zucaritask](http://github.com/zucaritask)

## Contributing

1. Fork it
1. Create your feature branch (git checkout -b my-new-feature)
1. Commit your changes (git commit -am 'Add some feature')
1. Push to the branch (git push origin my-new-feature)
1. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
