class Word
  @@dictionary = {}
  attr_reader :word, :definition

  def initialize(word)
    @word = word
    @definition = []
  end

  def add_definition(definition)
    @definition.push(definition)
  end

  def self.all
    @@dictionary
  end

end
