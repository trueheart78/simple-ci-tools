# frozen_string_literal: true
require_relative '../../test_helper'
require 'lexicon/show'

class Lexicon
  class ShowTest < Cli::TestSkeleton
    def test_displays_expected_results
      number = 10
      init_args 'test', number
      output = capture_output { Lexicon::Show.run }
      assert_match(/Displaying #{number} of them/, output)
      assert_match(/#{number}\./, output)
      refute_match(/#{(number + 1)}\./, output)
    end
  end
end
