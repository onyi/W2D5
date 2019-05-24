class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hashcode = 0
    self.each_with_index do |ele, i|
      hashcode += ele.hash * i.hash
    end
    hashcode
  end
end

class String
  def hash
    hashcode = 0
    self.each_char.with_index do |char, i|
      hashcode += char.ord * i.hash
    end
    hashcode
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashcode = 0

    self.each_key do |key|
      hashcode += self[key].hash 
    end
    hashcode
  end
end
