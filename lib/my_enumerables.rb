dule Enumerable

  def my_all?

    self.my_each do |elem|
      unless yield(elem)
        return false
      end
    end
    true
  end

  def my_any?
    
    self.my_each do |elem|
      if yield(elem)
        return true
      end
    end
     false
  end

  def my_count

    if block_given?
      count = 0

      my_each do |elem|
        count += 1 if yield(elem)
      end
      return count
    end
    size
  end

  def my_each_with_index

    if block_given?
      index = -1
      self.my_each do |elem|
        index += 1
        yield(elem, index)
      end
    end
    self
  end

  def my_inject(initial_value = nil)

    accumulator = initial_value
    
    my_each_with_index do |elem, index|
      product = yield(accumulator, elem)
      accumulator = product
    end
    accumulator
  end

  def my_map
    
    if block_given?

      new_array = []

      my_each do |elem|
        new_array << yield(elem)
      end
      new_array
    end
  end

  def my_none?
    
    self.my_each do |elem|
      if yield(elem)
        return false
      end
    end
     true
  end

  def my_select

    matching_values = []

    my_each do |elem|

      if yield(elem)
        matching_values << elem
      end
    end
    matching_values
  end
end

class Array

  def my_each
    if block_given?
     for i in 0...size
        yield(self[i])
     end
     self
    end
  end
end
