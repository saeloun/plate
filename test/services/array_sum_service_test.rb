# frozen_string_literal: true

require "test_helper"

class ArraySumServiceTest < ActiveSupport::TestCase
  def test_addition
    service = ArraySumService.new [1, 2, 3, 4, 5, 6]
    assert_equal 21, service.process
  end
end
