# frozen_string_literal: true
require_relative '../test_helper'
require 'i_heart_ruby/create'

class IHeartRuby
  class CreateTest < Cli::TestSkeleton
    def test_it_works
      Create.run
      assert true
    end
  end
end
