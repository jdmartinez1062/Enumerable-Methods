# frozen_string_literal: true

module Enumerable
  UNDEFINED = Object.new
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
    my_each_with_index do |x, i|
      array.push(self[i]) if yield(x)
    end
    array
  end

  def my_all?
    check = false
    my_each do |x|
      if yield(x)
        check = true
      else

        return false
      end
    end
    check
  end

  def my_any?
    check = true
    my_each do |x|
      if !yield(x)
        check = false
      else
        return true
      end
    end
    check
  end

  def my_none?
    check = false
    my_each do |x|
      if !yield(x)
        check = true
      else
        return false
      end
    end
    check
  end

  def my_count(condition = UNDEFINED)
    counter = 0
    my_each do |x|
      condition = yield(x) if block_given?
      if condition && block_given?
        counter += 1
      elsif condition == x
        counter += 1
      elsif condition == UNDEFINED
        counter += 1
      end
    end
    counter
  end

  def my_map
    my_each_with_index do |x, i|
      self[i] = yield(x)
    end
    self
  end

  def my_inject
    my_each do |x|
      sum |= x
      sum = yield(sum, x)
    end
    sum
  end
end
