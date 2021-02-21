require "test_helper"

class FullRequestLoggerTest < ActiveSupport::TestCase
  test "it has a version number" do
    assert FullRequestLogger::VERSION
  end

  test "truth" do
    assert_kind_of Module, FullRequestLogger
  end
end
