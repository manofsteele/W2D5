class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hashval = 0
    self.each_with_index do |el, idx|
      hashval += 42.hash * el * (idx + 1)
    end 
    hashval
  end
end

class String
  def hash
    hashval = 0
    self.chars.each_with_index do |el, idx|
      hashval += 42.hash * el.ord * (idx + 1)
    end 
    hashval
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashval = 0
    self.each do |key, val|
      hashval += key.hash * val.hash
    end 
    p hashval
    hashval
  end
end


