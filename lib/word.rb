class Word
  @@dictionary = {}
  attr_reader :word, :definition

  def initialize(word)
    @word = word
    @definition = []
  end


  # def to_s
  #   "#{@word}: #{@definition}"
  # end



  def string_definitions(word)
  end
end
