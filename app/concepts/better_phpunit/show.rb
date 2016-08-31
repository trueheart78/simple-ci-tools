# frozen_string_literal: true
require 'open3'

class BetterPhpunit
  class FileNotFoundError < StandardError; end

  class Show < Cli::Operation
    def perform
      puts "** Running #{command} **"
      # execute_command
    end

    def validate!
      raise FileNotFoundError if file_path && !File.exist?(file_path)
    end

    def success?
      true
    end

    private

    attr_reader :output

    def execute_command
      Open3.popen2e(command) do |_stdin, stdout, _wait_thr|
        while (line = stdout.gets)
          @output[] << line
          puts line
        end
      end
    end

    def command
      cmd = ['phpunit']
      cmd << file_path if file_path
      cmd << "--filter #{test_name}" if test_name
      cmd.join ' '
    end

    def line_number
      return unless ARGV[0]
      ARGV[0].split(':')[1].to_i if ARGV[0].include?(':')
    end

    def file_path
      @file_path ||= detect_file_path
    end

    def detect_file_path
      return if ARGV.empty?
      return ARGV[0].split(':').first if ARGV[0].include?(':')
      ARGV[0]
    end

    def test_name
      @test_name ||= detect_test_name
    end

    def detect_test_name
      return unless file_path
      return unless line_number && file_content.size >= line_number
      line = file_content.fetch line_number - 1, ''
      return extract_test_name(line) if test_name? line
    end

    def file_content
      @file_content ||= File.readlines file_path
    end

    def test_name?(string)
      string.include? 'public function test'
    end

    def extract_test_name(string)
      string.match(/.+(test.+)\(\)/)[1]
    end
  end
end
