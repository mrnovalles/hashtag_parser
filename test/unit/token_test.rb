require "test_helper"
require "pry"

class TokenTest < Minitest::Test

  def test_token_end_of_hashtag
    assert Token.new("$", 0).end_of_hashtag?
    pry.binding
    assert Token.new("#", 0).end_of_hashtag?
    assert Token.new(" ", 0).end_of_hashtag?
    assert Token.new("\n", 0).end_of_hashtag?
    assert Token.new("€", 0).end_of_hashtag?
    assert Token.new("'", 0).end_of_hashtag?
    assert Token.new("-", 0).end_of_hashtag?
    assert Token.new(")", 0).end_of_hashtag?
    assert Token.new("(", 0).end_of_hashtag?

    refute Token.new("_", 0).end_of_hashtag?
    refute Token.new("c", 0).end_of_hashtag?
  end
end
