require 'rspec'
require 'word'

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
  end

  describe '#add_definition' do
    it 'will add a definition to a word' do
      expect{ new_word.add_definition("to happen") }.to change{ new_word.definition }.from([]).to(["to happen"])
    end
  end

  describe '.all' do
    it 'will display the dictionary' do
      expect(Word.all).to eq({})
    end
  end

  describe '#save' do
    it 'will save word to dictionary' do
      new_word.save
      expect(Word.all).to eq({"transpire" => new_word})
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
end
