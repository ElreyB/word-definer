require 'rspec'
require 'word'

describe 'Word' do
  let(:new_word) { Word.new("transpire") }
  describe '#initialize' do
    it 'has a readable word' do
      expect(new_word.word).to eq "transpire"
    end

    it 'has a readable empty definition list for given word' do
      expect(new_word.definition).to eq []
    end
  end

  # describe '#to_s' do
  #   it 'has a user friendly print out of word with definition' do
  #     expect(new_word.to_s).to eq "transpire: to happen"
  #   end
  # end

  describe '#add_definition' do
    it 'will add a definition to a word' do
      expect{ new_word.add_definition("to happen") }.to change{ new_word.definition }.from([]).to(["to happen"])
    end
  end

  # describe "#string_definitions" do
  #   it 'will display all the definitions of a word' do
  #     expect
  #   end
  # end
end
