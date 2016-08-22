# frozen_string_literal: true
require 'lexicon'

class NameIt
  class Show < Cli::Operation
    attr_reader :matches, :words, :combinations

    def perform
      lookup
      create_combinations
      display_output
    end

    def display_output
      puts "Input was #{@name}"
      puts "Limit was #{limit} (of #{total_matches})"
      combinations.each_with_index do |combination, index|
        puts "#{index + 1}. #{combination}"
      end
    end

    def lookup
      @matches = {}
      words.each do |word|
        @matches[word] = Lexicon.find word, limit: limit, random: true
      end
    end

    def words
      @words ||= @name.strip.split('_')
    end

    def total_matches
      return @total_matches if @total_matches
      @total_matches = 1
      matches.values.each { |x| @total_matches *= x.count }
      @total_matches
    end

    def match_limit
      return limit if total_matches > limit
      total_matches
    end

    # each word should be cycled over
    # it should keep its place in the order
    # each combination should be unique
    def create_combinations
      @combinations = []
      match_limit.times do
        terms = words.map { |word| next_term(word) }
        mashup terms
      end
    end

    def next_term(word)
      return matches[word].shift if matches[word].any?
      word
    end

    def mashup(terms)
      combination = terms.join('_').tr(' ', '_')
      @combinations << combination unless @combinations.include? combination
      combination
    end

    def name
      return if @name
      @name = ARGV.first || ''
    end

    def limit
      limit = ARGV.second || 10
      return 0 if limit == 'all' || limit == '0'
      limit.to_i
    end

    def validate!
      explode if name.empty?
    end

    def explode
      puts 'Error: Missing argument for Method Name'
      exit 1
    end

    def success?
      true
    end
  end
end
