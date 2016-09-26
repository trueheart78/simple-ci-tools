# frozen_string_literal: true
require 'vim_history'
require 'shell_history'

class HistoryLesson
  class Show < Cli::Operation
    def perform
    end

    def validate!
    end

    def success?
      true
    end
  end
end
