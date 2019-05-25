class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    prev_node = @prev 
    next_node = @next
    prev_node.next = next_node
    next_node.prev = prev_node
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first

  end

  def last
  end

  def empty?
    @prev.nil? && @next.nil?
  end

  def get(key)
    @val if @key == key
  end

  def include?(key)
    if self.key == key
      return self
    else
      @next.include?(key)
    end
    
  end

  def append(key, val)
    
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    if @next.nil
      return []
    end
    @next.each << @val
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
