# frozen_string_literal: true
require_relative 'test_helper'

class RubocopTest < Minitest::Test
  def subject
    `rubocop`
  end

  def test_no_offenses_found
    refute_match(/Offenses/, subject)
  end
end
