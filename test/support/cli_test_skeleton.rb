# frozen_string_literal: true
class Cli
  class TestSkeleton < Minitest::Test
    def teardown
      ARGV.size.times { ARGV.shift }
    end

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

    def capture_output
      foo = StringIO.new
      old_stdout = $stdout
      $stdout = foo
      yield
      $stdout.string
    ensure
      $stdout = old_stdout
    end
    alias suppress_output capture_output
  end
end
