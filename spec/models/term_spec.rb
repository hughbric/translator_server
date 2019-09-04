require 'rails_helper'

RSpec.describe Term, type: :model do
  describe 'translate_term' do
    it 'starting with consonants' do
      expect(subject.translate_term('pig')).to eq('Igpay')
    end

    it 'staring with vowels' do
      expect(subject.translate_term('igloo')).to eq('Iglooway')
    end

    it 'single word vowels' do
      expect(subject.translate_term('I')).to eq('Iway')
    end

    it 'consonant clusters' do
      expect(subject.translate_term('glove')).to eq('Oveglay')
    end

    it 'translates multiple words' do
      expect(subject.translate_term('good evening')).to eq('Oodgay Eveningway')
    end

    it 'removes punctuation' do
      expect(subject.translate_term('Hello, Sir! Good evening?')).to eq('Ellohay Irsay Oodgay Eveningway')
    end

    it 'removes trailing whitespace' do
      expect(subject.translate_term('  Good evening  ')).to eq('Oodgay Eveningway')
    end
  end
end
