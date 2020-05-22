class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    # # #(index number * value in array) 0 + 1 * 2 + 2 * 3  = 8
    # sum = 0
    # a = 3
    # b = 7
    # self.each_with_index do |val, idx|
    #   sum += (a * (val * idx) + b) % size
    # end
    # sum.hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
  end
end
