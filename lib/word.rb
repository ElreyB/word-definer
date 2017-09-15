class Word
  @@dictionary = {}
  attr_reader :word, :definition

  def initialize(word, definition)
    @word = word
    @definition = definition
  end
end
