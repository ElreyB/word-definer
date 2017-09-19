class Word
  @@dictionary = {}
  attr_reader :word, :definition, :photo

  def initialize(word)
    @word = word.downcase
    @definition = []
    @photo = ""
  end

  def add_definition(definition)
    if definition =~ /^[a-z\s]*$/i
      @definition.push(definition)
      return true
    else
      return false
    end

  end

  def self.all
    @@dictionary
  end

  def save
    if self.class == Word && self.word =~ /^[a-z]*$/i
      @@dictionary[self.word] = self
      return true
    else
      return false
    end
  end

  def self.clear
    @@dictionary = {}
  end

  def self.find_definition(word)
    @@dictionary[word].definition
  end

  def self.find(word)
    @@dictionary[word]
  end

  def self.delete(word)
    @@dictionary.delete(word)
  end

  def add_photo(photo_name)
    if photo_name =~ /^[a-z0-9\W][^\s]*.jpe?g$/i
      @photo = photo_name
      return true
    else
      return false
    end
  end

  def delete_photo
    @photo = ""
  end
end
