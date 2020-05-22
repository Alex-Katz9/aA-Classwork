def bad_two_sum?(arr, target)
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            if j != i && arr[i] + arr[j] == target
                return true
            end
        end
    end
    return false
end
#Big(O)= n * n = n^2

def okay_two_sum?(arr, target)
    sorted = arr.sort 
    sorted.each_with_index do |ele, idx|
       ele2 = sorted.bsearch {|n| n == (target - ele)}
    #    p ele2
       if ele2 != nil && ele2 != ele
        return true
       end
    end
    false
end

# #Big(O)= nlog(n) + n * n = n^2 + nlog(n) => n^2
class Array
  # Write a monkey patch of binary search:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(5) => 4
  # **Do NOT use the built in `Array#index` `Array#find_index`, `Array#include?`,
  # or `Array#member` methods in your implementation.**

  def my_bsearch(target)
    return nil if size == 0
    mid = size/2

    case self[mid] <=> target
    when 0
      return mid
    when 1
      return self.take(mid).my_bsearch(target)
    else
      search_res = self.drop(mid+1).my_bsearch(target)
      search_res.nil? ? nil : mid + 1 + search_res
    end
  end
end

# #Big(O)= nlog(n) * n

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false


def two_sum(arr, target)
    hash = {}
    arr.map.with_index {|ele, i| hash[i] = ele}
    hash.map {|k,v| return true if hash.include?(target - v) && hash} 
end


#and if target - v = v then there exists another h[k] = v