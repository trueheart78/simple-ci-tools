# frozen_string_literal: true
require_relative '../../test_helper'
require 'name_it/show'

class NameIt
  class ShowTest < Cli::TestSkeleton
    def subject
      NameIt::Show.run
    end

    def test_returns_unique_matches
      init_args 'test_method', 5
      assert_equal(2, subject.matches.size)
    end
  end
end
