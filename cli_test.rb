# frozen_string_literal: true
require_relative 'test_helper'

class RubocopTest < Minitest::Test
  def subject
    Cli.new
  end
end
