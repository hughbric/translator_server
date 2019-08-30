require 'rails_helper'

RSpec.describe Term, type: :model do
  describe 'translate_term' do
    it 'starting with consonants' do
      term = Term.new
      expect(term.translate_term('pig')).to eq('igpay')
    end
  end
end
