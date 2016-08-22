# frozen_string_literal: true
require 'thesaurus'

class Lexicon
  def self.find(word, limit: 'all', random: false)
    synonyms = lookup word
    return limited_amount(synonyms, limit, random) unless limit.to_i.zero?
    synonyms.shuffle! if random
    synonyms
  end

  class << self
    private

      def lookup(word)
        Thesaurus.lookup(word).map(&:root)
      end

      def limited_amount(synonyms, limit, random)
        return synonyms.sample(limit) if random
        synonyms.take limit
      end
  end
end
