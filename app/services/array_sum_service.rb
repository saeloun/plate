# frozen_string_literal: true

class ArraySumService
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def process
    array.inject(&:+)
  end
end
