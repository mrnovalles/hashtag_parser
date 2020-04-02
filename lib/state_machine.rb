module HashtagParser
  class StateMachine
    attr_accessor(
      :start_index,
      :parsing_hashtag,
      :buffer,
      :hashtags,
      :consumed_anything
    )

    def initialize
      set_initial_defaults
      @hashtags = []
    end

    def set_initial_defaults
      @parsing_hashtag = false
      @start_index = 0
      @buffer = []
      @consumed_anything = false
    end

    def consume_char(char)
      buffer << char
      @consumed_anything = true
    end

    def hashtag_seen_at(index)
      @start_index = index
    end

    def hashtag_finishes_at(index)
      if consumed_anything
        hashtags.push(
          {
            text: buffer.join,
            start: start_index,
            end: index
          }
        )
      end
      reset_state
    end

    def parsing_hashtag?
      parsing_hashtag
    end

    def reset_state
      set_initial_defaults
    end
  end
end
