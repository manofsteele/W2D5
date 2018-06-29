class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num - 1] = true
  end

  def remove(num)
    raise "Out of bounds" unless is_valid?(num)
    @store[num - 1] = false
  end

  def include?(num)
    @store[num - 1]
  end

  private

  def is_valid?(num)
    num > 0 && num <= @max
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
    # @store.each do |bucket|
    #   return true if bucket.include?(num)
    # end 
    self[num].include?(num)
    # false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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

  []=
[]

  def insert(num)
    unless self.include?(num)
      resize! if @count == num_buckets
      self[num] << num 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
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
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(num_buckets * 2) {Array.new}
    @store.each do |bucket|
      bucket.each do |el| 
        new_store[el % (num_buckets * 2)] << el
      end
    end 
    @store = new_store
  end
end

# 
# intset = IntSet.new
# intset.insert(-1)
# intset.insert(1)
# intset.insert(5)
# intset.remove(-1)
# p intset

