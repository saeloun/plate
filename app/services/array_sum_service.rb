# frozen_string_literal: true

class ArraySumService
  attr_reader :array

  def initialize(array)
    @array = array
    raise_error_if_argument_is_not_an_array
  end

  def process
    array.inject(&:+)
  end

  private
    def raise_error_if_argument_is_not_an_array
      raise "Passed argument is not an array" unless array.is_a? Array
    end
end
