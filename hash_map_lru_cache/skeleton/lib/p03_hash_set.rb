class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if count >= num_buckets
    unless include?(key)
      self[key] << key 
      @count += 1 
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if include?(key)
      self[key].delete(key) 
      @count -= 1
    end  
  end

  private

  def [](val)
    # optional but useful; return the bucket corresponding to `num`
    @store[val.hash % num_buckets]
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
