require "test_helper"

class StateMachineTest < Minitest::Test

  attr_accessor :state_machine

  def setup
    @state_machine = HashtagParser::StateMachine.new
  end

  def test_that_it_initializes_with_sane_values
    assert_equal state_machine.parsing_hashtag?, false
    assert_equal state_machine.start_index, 0
    assert_equal state_machine.buffer, []
    assert_equal state_machine.hashtags, []
    assert_equal state_machine.consumed_anything, false
  end

  def test_consume_char
    state_machine.consume_char('a')

    assert_equal state_machine.buffer, ['a']
    assert state_machine.consumed_anything
  end

  def test_hashtag_finishes_at_sets_the_buffer_and_resets_state
    word = ['r', 'b']
    word.each do |char|
      state_machine.consume_char(char)
    end
    end_index = word.size - 1
    state_machine.hashtag_finishes_at(end_index)

    assert_equal state_machine.hashtags, [
      { start: 0, end: end_index, text: "rb" }
    ]

    assert_equal state_machine.start_index, 0
    assert_equal state_machine.buffer, []
    assert_equal state_machine.consumed_anything, false
  end

  def test_hashtag_seen_at
    state_machine.hashtag_seen_at(42)
    assert_equal state_machine.start_index, 42
  end
end
