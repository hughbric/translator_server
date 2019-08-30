class Term < ApplicationRecord
  validates_presence_of :term, :pig_latin

  VOWELS = ['A', 'E', 'I', 'O', 'U']

  def translate_term(term)
    return if term == nil
    output = ''
    words = term.split

    words.each do |word|
      if !output.empty?
        output << ' '
      end

      if !VOWELS.include?(word[0].upcase)
        if !VOWELS.include?(word[1].upcase)
          output << mutate_double_consonant(word)
        else
          output << mutate_consonant(word)
        end
      end

      if VOWELS.include?(word[0].upcase)
        output <<  word + 'way'
      end
    end
    output
  end

  private

  def mutate_double_consonant(word)
    first_letters = word.slice(0..1)
    last_letters = word[2..-1]
    output = last_letters + first_letters + 'ay'
  end

  def mutate_consonant(word)
    first_letter = word.slice(0)
    last_letters = word[1..-1]
    output = last_letters + first_letter + 'ay'
  end
end
