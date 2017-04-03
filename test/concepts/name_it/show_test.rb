# frozen_string_literal: true
require_relative '../../test_helper'
require 'name_it/show'

class NameIt
  class ShowTest < Cli::TestSkeleton
    def setup
      init_args 'test_it', 5
    end

    def test_returns_unique_matches
      methods = content.scan(/\d\.\s(\w+)/).flatten
      assert_equal(5, methods.size)
      methods.each do |method|
        matches = content.scan(/#{method}/).flatten
        assert_equal(1, matches.size)
      end
    end

    def test_displays_name_input
      assert_match(/Input was test_it/, content)
    end

    def test_displays_number_displayed
      assert_match(/Limit was 5/, content)
    end

    def content
      @content ||= capture_output { NameIt::Show.run }
    end
  end
end
