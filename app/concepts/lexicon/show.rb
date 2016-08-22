# frozen_string_literal: true
class Lexicon
  class Show < Cli::Operation
    attr_accessor :matches

    def perform
      lookup
      display_matches
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

    def lookup
      require 'thesaurus'
      @matches = Thesaurus.lookup @name
    end

    def display_matches
      header
      output(matches) if show_all?
      output(matches.sample(limit)) unless show_all?
    end

    def header
      puts "#{matches.size} #{'match'.pluralize(matches.size)} for '#{@name}'"
    end

    def output(collection)
      puts "Displaying #{output_count(collection)} of them"
      @count = 0
      collection.each do |entry|
        @count += 1
        display_entry(@count, entry)
      end
    end

    def output_count(collection)
      return 'all' if show_all?
      collection.size
    end

    def display_entry(number, entry)
      puts "#{number}. #{entry.root}"
    end

    def validate!
      explode if name.empty?
    end

    def explode
      puts 'Error: Missing argument for Name'
      exit 1
    end

    def match_found?
      matches.any?
    end

    def success?
      true
    end
  end
end
