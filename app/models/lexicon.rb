# frozen_string_literal: true
require 'thesaurus'

class Lexicon
  def self.find(string, number = 'all')
    matches = Thesaurus.lookup string
    entries = matches.map(&:root)
    return entries.take(number) unless number.to_i.zero?
    entries
  end
end
