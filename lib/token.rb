class Token
  END_OF_HASHTAG_REGEX = /[\\¿¡&%#\s!@$'^&*().,\-<>\/|\[\]{}`~=+;?£€•´:]/

  attr_reader :char, :type, :index

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

  def hashtag?
    @type == :hashtag
  end

  def end_of_hashtag?
    case type
    when :char
      END_OF_HASHTAG_REGEX.match?(char)
    when :hashtag
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
  def initialize(index)
    @type = :sos
    @index = index
  end

  def end_of_hashtag?
    false
  end
end

class EndOfStringToken < Token
  def initialize(index)
    @type = :eos
    @index = index
  end
end
