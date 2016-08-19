# frozen_string_literal: true
class NameIt
  class Show < Cli::Operation
    attr_reader :response

    def perform
      puts 'naming is hard'
    end

    def name
      ARGV.first || ''
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
