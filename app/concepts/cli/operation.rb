# frozen_string_literal: true
class Cli
  class Operation
    def self.run
      new.tap do |instance|
        instance.validate!
        instance.perform
      end
    end

    private

    attr_writer :success

    def perform
      raise StandardError, 'Private method should be overridden by child'
    end

    def validate!
      raise StandardError, 'Private method should be overridden by child'
    end

    def success?
      @success
    end
  end
end
