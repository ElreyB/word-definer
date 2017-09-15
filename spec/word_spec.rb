require 'rspec'
require 'word'

describe 'Word' do
  let(:new_word) { Word.new("transpire", "to happen") }

  describe '#initialize' do
    it 'has a readable word' do
      expect(new_word.word).to eq "transpire"
    end

    it 'has a readable definition for given word' do
      expect(new_word.definition).to eq "to happen"
    end
  end
end
