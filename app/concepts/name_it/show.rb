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
      puts "Limit was #{limit}"
      puts "Total Matches: #{total_matches}"
      pp combinations
    end

    def lookup
      @words = @name.strip.split('_')
      @matches = {}
      words.each do |word|
        @matches[word] = Lexicon.find(word, limit)
      end
    end

    def total_matches
      matches.values.sum &:count
    end

    def create_combinations
      @combinations = []
      limit.times do
        words.each do |word|
          combo = [matches[word].sample]
          words.each do |other_word|
            combo << matches[other_word].sample unless other_word == word
          end
          @combinations << combo.join('_').tr(' ','_')
        end
      end
      @combinations.shuffle!
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

    def show_all?
      limit.zero?
    end

    def validate!
      explode if name.empty?
    end

    def explode
      puts 'Error: Missing argument for Name'
      exit 1
    end

    def success?
      true
    end
  end
end
