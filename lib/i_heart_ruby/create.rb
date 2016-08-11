# frozen_string_literal: true
class IHeartRuby
  class Create < Cli::Operation
    def perform
      puts 'x'
    end

    def validate!
      true
    end
  end
end
