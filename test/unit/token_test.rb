require "test_helper"

class TokenTest < Minitest::Test

  def test_token_end_of_hashtag
    assert HashtagParser::Token.new("$", 0).end_of_hashtag?
    assert HashtagParser::Token.new(" ", 0).end_of_hashtag?
    assert HashtagParser::Token.new("\n", 0).end_of_hashtag?
    assert HashtagParser::Token.new("€", 0).end_of_hashtag?
    assert HashtagParser::Token.new("'", 0).end_of_hashtag?
    assert HashtagParser::Token.new("-", 0).end_of_hashtag?
    assert HashtagParser::Token.new(")", 0).end_of_hashtag?
    assert HashtagParser::Token.new("(", 0).end_of_hashtag?

    refute HashtagParser::Token.new("#", 0).end_of_hashtag?
    refute HashtagParser::Token.new("_", 0).end_of_hashtag?
    refute HashtagParser::Token.new("c", 0).end_of_hashtag?
  end

  def test_hashtag_method
    token = HashtagParser::Token.new("#", 0)
    assert token.hashtag?
  end
end
