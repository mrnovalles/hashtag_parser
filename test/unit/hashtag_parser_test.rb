require "test_helper"

class HashtagParserTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HashtagParser::VERSION
  end

  def test_it_parses_hashtags_from_text
    hashtags = HashtagParser.parse("#ruby is #awesome")
    assert_equal(
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
      ],
      hashtags
    )
  end
end
