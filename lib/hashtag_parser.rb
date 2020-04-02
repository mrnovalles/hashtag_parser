require "hashtag_parser/version"
require "state_machine"
require "tokenizer"
require "token"

module HashtagParser
  class Parser
    def self.parse(text)
      tokens = Tokenizer.tokenize(text)
      state_machine = StateMachine.new
      tokens.each_with_index do |token, index|
        next_token = tokens[index + 1]
        index = index - 1 unless token.type == :sos

        case token.type
        when :sos
          state_machine.hashtag_incoming if next_token.hashtag?
        when :hashtag
          if state_machine.parsing_hashtag?
            if next_token.end_of_hashtag?
              state_machine.reset_state
            else
              state_machine.hashtag_seen_at(index)
            end
          end
        when :char
          if state_machine.parsing_hashtag?
            if token.end_of_hashtag?
              state_machine.hashtag_finishes_at(index - 1)
            else
              state_machine.consume_char(token.char)
            end

            if next_token.hashtag?
              state_machine.hashtag_finishes_at(index)
              state_machine.hashtag_incoming
            end
          end
        when :whitespace
          state_machine.hashtag_finishes_at(index - 1) if state_machine.parsing_hashtag?
          state_machine.hashtag_incoming if next_token.hashtag?
        when :eos
          if state_machine.parsing_hashtag?
            state_machine.hashtag_finishes_at(index - 1)
          end
        end
      end
      state_machine.hashtags
    end
  end
end
