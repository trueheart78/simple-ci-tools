# frozen_string_literal: true
require_relative 'test_helper'
require 'parse_json/show'

class ParseJson
  class ShowTest < Cli::TestSkeleton
    def test_it_works
      init_args 'https://api.github.com/users/trueheart78'
      Show.run
      assert true
    end
  end
end
