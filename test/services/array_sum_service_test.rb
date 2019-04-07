# frozen_string_literal: true

require "test_helper"

class ArraySumServiceTest < ActiveSupport::TestCase
  def test_addition
    service = ArraySumService.new [1, 2, 3, 4, 5, 6]
    assert_equal 21, service.process
  end

  def test_error_if_argument_passed_is_not_an_array
    error = assert_raises(RuntimeError) { ArraySumService.new "This is a string" }
    assert_equal "Passed argument is not an array", error.message
  end
end
