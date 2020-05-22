class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return false if @store[num] 
    self.store[num] = true
  end

  def remove(num)
    validate!(num)
    return false unless @store[num]
    self.store[num] = false
    return num
  end

  def include?(num)
    validate!(num)
    self.store[num]
  end

  private

  def is_valid?(num)
    (num >= 0 && num < self.store.length)? true : false
  end

  def validate!(num)
    raise "Out of bounds" if !is_valid?(num)
  end
end


class IntSet
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return false if include?(num)
    self[num] << num
    return true
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
    #self.insert(num)
  end

  private

  def [](num)
    self.store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end







class ResizingIntSet
  
  attr_accessor :store, :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    return false if include?(num)
    self[num] << num 
    self.count += 1 #reassigning self.
    resize! if @store.length < self.count
     
  end

  def remove(num)
     if self[num].delete(num)
        self.count -= 1
     end
    
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    self.store[num % num_buckets] 
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    store_copy = @store
    self.store = Array.new(num_buckets * 2){ Array.new }
    self.count = 0
    store_copy.flatten.each { |ele| insert(ele)}
  
  end
end
