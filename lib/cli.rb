# frozen_string_literal: true
class Cli
  def run(*args)
    validate!(*args)
    perform(*args)
  end

  private

  attr_writer :success

  def perform(*_args)
    raise StandardError, 'Public method should be overridden by child'
  end

  def validate!(*_args)
    raise StandardError, 'Private method should be overridden by child'
  end

  def success?
    @success
  end
end
