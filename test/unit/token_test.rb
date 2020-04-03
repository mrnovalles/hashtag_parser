require "test_helper"

class TokenTest < Minitest::Test

  def test_token_end_of_hashtag
    assert Token.new("$", 0).end_of_hashtag?
    assert Token.new(" ", 0).end_of_hashtag?
    assert Token.new("\n", 0).end_of_hashtag?
    assert Token.new("€", 0).end_of_hashtag?
    assert Token.new("'", 0).end_of_hashtag?
    assert Token.new("-", 0).end_of_hashtag?
    assert Token.new(")", 0).end_of_hashtag?
    assert Token.new("(", 0).end_of_hashtag?

    refute Token.new("#", 0).end_of_hashtag?
    refute Token.new("_", 0).end_of_hashtag?
    refute Token.new("c", 0).end_of_hashtag?
  end

  def test_hashtag_method
    token = Token.new("#", 0)
    assert token.hashtag?
  end
end
