require 'rspec'
require 'word'
require 'pry'

describe 'Word' do
  before do
    Word.clear
  end

  let(:new_word) { Word.new("transpire") }

  describe '#initialize' do
    it 'has a readable word' do
      expect(new_word.word).to eq "transpire"
    end

    it 'has a readable empty definition list for given word' do
      expect(new_word.definition).to eq []
    end

    it 'has a readable empty string for photo' do
      expect(new_word.photo).to eq ""
    end
  end

  describe '#add_definition' do
    it 'will add a definition to a word' do
      expect{ new_word.add_definition("to happen") }.to change{ new_word.definition }.from([]).to(["to happen"])
    end

    it 'will return false when word is not saved' do
      not_a_word = Word.new("Elrey")
      expect(not_a_word.add_definition("9383 3938 383")).to eq false
    end
  end

  describe '.all' do
    it 'will display the dictionary' do
      expect(Word.all).to eq({})
    end
  end

  describe '#save' do
    it 'will save word to dictionary' do
      expect{ new_word.save }.to change{ Word.all }.from({}).to({"transpire" => new_word})
    end

    it 'will return true when word is saved' do
      expect(new_word.save).to eq true
    end

    it 'will return false when word is not saved' do
      not_a_word = Word.new("934njd00-2")
      expect(not_a_word.save).to eq false
    end
  end

  describe '.clear' do
    it 'will clear the dictionary of words' do
      new_word.save
      expect{ Word.clear }.to change{ Word.all }.from({"transpire" => new_word}).to({})
    end
  end

  describe '.find_definition' do
    it 'will find definition for the word give' do
      new_word.save
      expect(Word.find_definition(new_word.word)).to eq []
    end
  end

  describe '.find' do
    it 'will find instance of word by the word' do
      new_word.save
      expect(Word.find(new_word.word)).to eq new_word
    end
  end

  describe '.delete' do
    it 'will remove word from dictionary' do
      new_word.save
      Word.delete(new_word.word)
      expect(Word.all).to eq({})
    end
  end

  describe '#add_photo' do
    it 'will add photo jpg name to .photo' do
      expect{ new_word.add_photo("transpire.jpg") }.to change{ new_word.photo }.from("").to("transpire.jpg")
    end

    it 'will return true when photo name is added' do
      expect(new_word.add_photo("https://vignette4.wikia.nocookie.net/phobia/images/a/aa/Snow.jpg")).to eq true
    end

    it 'will return false when photo name is not added' do
      expect(new_word.add_photo("transpire.png")).to eq false
    end
  end

  describe '#delete_photo' do
    it 'will delete photo name' do
      new_word.add_photo("https://vignette4.wikia.nocookie.net/phobia/images/a/aa/Snow.jpg")
      expect{ new_word.delete_photo }.to change{ new_word.photo }.from("https://vignette4.wikia.nocookie.net/phobia/images/a/aa/Snow.jpg").to("")
    end
  end
end
