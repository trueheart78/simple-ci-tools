# frozen_string_literal: true
require_relative '../../test_helper'
require 'better_phpunit/show'

class BetterPhpunit
  class ShowTest < Cli::TestSkeleton
    def test_it_runs_all_tests
      assert_match(content, response)
    end

    def test_it_runs_a_specific_file
      init_args file_path
      assert_match(content_with_file, response)
    end

    def test_it_runs_a_specific_line
      init_args file_path(17)
      assert_match(content_with_test, response)
    end

    def test_it_fallbacks_to_the_file_on_invalid_line
      init_args file_path(10_000)
      assert_match(content_with_file, response)
    end

    def test_it_throws_an_exception_on_invalid_file
      init_args '/no-file/should-exist/here.php'
      assert_raises(FileNotFoundError) do
        Show.run
      end
    end

    def response
      @response ||= capture_output { Show.run }
    end

    def content
      /\*\*\sRunning\sphpunit\s\*\*/
    end

    def content_with_file
      /\*\*\sRunning\sphpunit\s#{file_path}\s\*\*/
    end

    def content_with_test
      /\*\*\sRunning\sphpunit\s#{file_path}\s--filter\stestValidity\s\*\*/
    end

    def file_path(line_number = nil)
      path = fixture_path 'better_phpunit/valid_test.php'
      return "#{path}:#{line_number}" if line_number
      path
    end
  end
end
