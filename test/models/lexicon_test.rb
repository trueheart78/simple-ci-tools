# frozen_string_literal: true
require_relative '../test_helper'
require 'lexicon'

class LexiconTest < Minitest::Test
  def subject
    Lexicon.find 'test'
  end

  def test_it_returns_an_array
    assert(subject.is_a?(Array))
  end

  def test_it_returns_all
    assert_equal(133, subject.size)
  end

  def test_it_returns_the_quantity
    data = Lexicon.find 'test', 23
    assert_equal(23, data.size)
  end
end
