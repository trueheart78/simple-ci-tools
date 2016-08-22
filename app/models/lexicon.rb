# frozen_string_literal: true
require 'thesaurus'

class Lexicon
  def self.find(string, number = 'all')
    matches = Thesaurus.lookup string
    matches.map(&:root)
    return matches.take(number) if number.to_i.positive?
    matches
  end
end
