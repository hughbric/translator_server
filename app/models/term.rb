class Term < ApplicationRecord
  validates_presence_of :term, :pig_latin

  VOWELS = ['A', 'E', 'I', 'O', 'U']

  def translate_term(term)
    if !VOWELS.include?(term[0].upcase)
      first_letter = term.slice(0)
      last_letters = term[1..-1]
      output = last_letters + first_letter + 'ay'
    end
  end
end
