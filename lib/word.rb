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

  def save
    @@dictionary[self.word] = self.definition
  end

  def self.clear
    @@dictionary = {}
  end

end
