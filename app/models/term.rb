class Term < ApplicationRecord
  validates_presence_of :term, :pig_latin

  VOWELS = ['a', 'e', 'i', 'o', 'u']

  def translate_term(term)
    return if term == nil
    output = ''
    words = term.downcase.gsub(/[^[:word:]\s]/, '').strip.split

    words.each do |word|
      if !output.empty?
        output << ' '
      end

      if !VOWELS.include?(word[0])
        if !VOWELS.include?(word[1])
          output << mutate_double_consonant(word).capitalize
        else
          output << mutate_consonant(word).capitalize
        end
      end

      if VOWELS.include?(word[0])
        trans_word = word + 'way'
        output <<  trans_word.capitalize
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
