require "test_helper"

class TokenizerTest < Minitest::Test

  def test_tokenizer_returns_a_list_of_tokens
    result = HashtagParser::Tokenizer.tokenize("#tis a #tag")
    assert_equal(
      [
        {type: :sos, index: -1, char: nil},
        {type: :hashtag, index: 0, char: nil},
        {type: :char, index: 1, char: 't'},
        {type: :char, index: 2, char: 'i'},
        {type: :char, index: 3, char: 's'},
        {type: :whitespace, index: 4, char: nil},
        {type: :char, index: 5, char: 'a'},
        {type: :whitespace, index: 6, char: nil},
        {type: :hashtag, index: 7, char: nil},
        {type: :char, index: 8, char: 't'},
        {type: :char, index: 9, char: 'a'},
        {type: :char, index: 10, char: 'g'},
        {type: :eos, index: 11, char: nil}
      ],
      result.map(&:as_json)
    )
  end

  def test_tokenizer_returns_a_list_of_tokens_for_emoji
    result = HashtagParser::Tokenizer.tokenize("🥑")
    assert_equal(
      [
        {type: :sos, index: -1, char: nil},
        {type: :char, index: 0, char: '🥑'},
        {type: :eos, index: 1, char: nil}
      ],
      result.map(&:as_json)
    )
  end
end
