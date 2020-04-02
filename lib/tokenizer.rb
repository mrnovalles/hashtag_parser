module HashtagParser
  class Tokenizer
    def self.tokenize(text)
      tokens = [StartOfString.new]
      text.split("").each_with_index do |char, index|
        tokens << Token.new(char, index)
      end
      tokens << EndOfStringToken.new(text.size)
    end
  end

  class Token
    # https://rubular.com/r/8sOK5MJz9W60N6
    @@end_of_hashtag_regex = /[\\&%#\s\n\t!@$^&*()\r.,-<>\/|\[\]{}`~=+;?£•´:]/

    attr_reader :char, :index, :type

    def initialize(char, index)
      @index = index
      case char
      when "#"
        @type = :hashtag
      when " ", "\n", "\r", "\t"
        @type = :whitespace
      else
        @type = :char
        @char = char
      end
    end

    def end_of_hashtag?
      case type
      when :char
        @@end_of_hashtag_regex.match?(char)
      when :hashtag, :sos
        false
      else
        true
      end
    end

    def as_json
      {
        type: type,
        index: index,
        char: char
      }
    end
  end

  class StartOfString < Token
    def initialize
      @type = :sos
    end
  end

  class EndOfStringToken < Token
    def initialize(index)
      @type = :eos
      @index = index
    end
  end
end
