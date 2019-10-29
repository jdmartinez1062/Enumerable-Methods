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

  
end
