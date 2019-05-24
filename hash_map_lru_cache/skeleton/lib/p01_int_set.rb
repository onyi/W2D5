class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    is_valid?(num)
    @store[num] = true
    return @store[num]
  end
  
  def remove(num)
    @store[num] = false
  end
  
  def include?(num)
    @store[num] 
  end
  
  private
  
  def is_valid?(num)
    raise "Out of bounds" if num > @store.length || num < 0
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num 
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    raise "negative number" if num < 0
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if count >= num_buckets
    unless include?(num)
      self[num] << num 
      @count += 1 
    end
  end

  def remove(num)
    if include?(num)
      self[num].delete(num) 
      @count -= 1
    end  
  end

  def include?(num)
    self[num].include?(num)
  end
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    raise "negative number" if num < 0
    #raise "out of bound" if num > num_buckets
    @store[num % num_buckets] 
  end

  def num_buckets
    @store.length 
  end

  def resize!
    size = num_buckets
    size *= 2
    old_store = @store
    @store = Array.new(size) { Array.new }
    old_store.each do |arr|
      arr.each do |ele|
        self[ele] << ele
      end
    end
  end
end
