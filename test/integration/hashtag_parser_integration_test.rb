require "test_helper"
require "json"

class HashtagParserIntegrationTest < Minitest::Test
  attr_reader :json

  def setup
    filename = File.join(File.dirname(__FILE__), '../fixtures/hashtags.json')
    @json = JSON.parse(File.read(filename), symbolize_names: true)
  end

  def test_it_parses_the_text_from_the_json_file
    json.each do |test_case|
      result = HashtagParser.parse(test_case[:text])
      expected = test_case[:hashtags]
      assert_equal(result, expected, "Result #{result} is not as #{expected}")
    end
  end
end
