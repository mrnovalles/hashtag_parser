# HashtagParser

[![Build Status](https://travis-ci.org/zucaritask/hashtag_parser.svg?branch=master)](https://travis-ci.org/zucaritask/hashtag_parser)

A hashtag parser that brings the behavior of [hashtag-rs](https://github.com/tonsser/hashtag-rs)
to ruby and the work of using an Finite State Machine to do the parsing by [davidpdrsn](https://github.com/davidpdrsn)

Given a string, this gem returns an array with an object with `text`, `start` and `end`
for each ocurrence of a hashtag in the text.

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
hashtags = HashtagParser.parse("#ruby is #awesome")
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
