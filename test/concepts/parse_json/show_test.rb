# frozen_string_literal: true
require_relative '../../test_helper'
require 'parse_json/show'

class ParseJson
  class ShowTest < Cli::TestSkeleton
    def setup
      stub_url
      init_args 'https://api.github.com/users/trueheart78'
    end

    def test_it_works
      response = capture_output { Show.run }
      assert_match(/sample/, response)
      assert_match(/works/, response)
    end

    def json_content
      { sample: 'works' }.to_json
    end

    def stub_url
      stub_request(:get, 'https://api.github.com/users/trueheart78')
        .with(headers: { 'Accept' => 'application/json' })
        .to_return(status: 200,
                   body: json_content,
                   headers: { 'Content-Type' => 'application/json' })
    end
  end
end
