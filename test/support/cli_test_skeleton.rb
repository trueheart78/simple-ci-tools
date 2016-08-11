# frozen_string_literal: true
class CliTestSkeleton < Minitest::Test
  def init_args(*args)
    args.each { |a| ARGV << a }
  end

  def described_class
    class_name = self.class.name
    is_test = class_name[-4..-1] == 'Test' ? true : false
    class_name = class_name[0...-4] if is_test
    class_name.constantize
  end

  def test_public_interface
    assert true, described_class.respond_to?(:run)
    refute described_class.respond_to?(:perform)
  end
end
