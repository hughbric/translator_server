require 'rails_helper'

RSpec.describe Term, type: :model do
  describe 'translate_term' do
    it 'starting with consonants' do
      term = Term.new
      expect(term.translate_term('pig')).to eq('igpay')
    end

    it 'staring with vowels' do
      term = Term.new
      expect(term.translate_term('igloo')).to eq('iglooway')
    end

    it 'single word vowels' do
      term = Term.new
      expect(term.translate_term('I')).to eq('Iway')
    end

    it 'consonant clusters' do
      term = Term.new
      expect(term.translate_term('glove')).to eq('oveglay')
    end

    it 'translates multiple words' do
      term = Term.new
      expect(term.translate_term('good evening')).to eq('oodgay eveningway')
    end
  end
end
