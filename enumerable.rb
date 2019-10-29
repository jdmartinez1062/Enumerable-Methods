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
  
  def my_all?(condition = UNDEFINED)
    check = true

    if block_given?
      my_each do |x|
        return false unless yield(x)
      end
    elsif condition
      my_each do |x|
        return false unless x == condition
      end
    else
      my_each do |x|
        return false unless x
      end
    end
    check
  end

  def my_any?(condition = UNDEFINED)
    check = false

    if block_given?
      my_each do |x|
        return true if yield(x)
      end
    elsif condition
      my_each do |x|
        return true if x == condition
      end
    else
      my_each do |x|
        return true if x
      end
    end
    check
  end

  def my_none?(condition = UNDEFINED)
    check = true

    if block_given?
      my_each do |x|
        return false if yield(x)
      end
    elsif condition
      my_each do |x|
        return false if x == condition
      end
    else
      my_each do |x|
        return false if x
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

end
