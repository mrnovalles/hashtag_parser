class Tokenizer
  def self.tokenize(text)
    tokens = [StartOfString.new(-1)]
    text.split("").each_with_index do |char, index|
      tokens << Token.new(char, index)
    end
    tokens << EndOfStringToken.new(text.size)
  end
end
