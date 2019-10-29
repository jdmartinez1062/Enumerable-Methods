# frozen_string_literal: true

module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
  end

  def my_select
    array = []
    if block_given?
      my_each_with_index do |x, i|
        array.push(self[i]) if yield(x)
      end
    else
      new_e = Enumerator.new(array, :my_select)
      return new_e
    end
    array
  end
end
