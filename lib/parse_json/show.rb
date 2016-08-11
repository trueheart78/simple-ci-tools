# frozen_string_literal: true
class ParseJson
  class Show < Cli::Operation
    attr_reader :response

    def perform
      capture_page
      display_json if success?
    end

    def url
      ARGV.first || ''
    end

    def display_json
      pp JSON.parse response.body
    end

    def capture_page
      @response = faraday.get
      raise "Error Received: #{response.code}" unless response.success?
    end

    def faraday
      Faraday.new(url: url) do |faraday|
        faraday.adapter :typhoeus
      end
    end

    def validate!
      explode if url.empty?
    end

    def explode
      puts 'Error: Missing argument for URL'
      exit 1
    end

    def success?
      response.success?
    end
  end
end
