def my_min(arr)
    current_min = nil
    arr.each_with_index do |ele, i|
        min = true
        arr.each_with_index do |ele2, j|
            # current_min = ele if ele < current_min || current_min == nil
            if i != j
                min = false if ele2 < ele
            end
        end
        return ele if min
    end
end
#Big(O) = n^2
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)

def mymin(arr)
    current_min = nil
    arr.each_with_index do |ele, i|
        current_min = ele if  current_min == nil || ele < current_min
    end
    current_min
end
#Big(O) = n
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p mymin(list)

def largest_contiguous_subsum(arr)
    subs = []
    (0...arr.length).each do |i|
        (i...arr.length).each do |j|
            subs << arr[i..j]
        end
    end
    sums = subs.map {|sub| sub.sum}
    sums.sort[-1]
end
#BigO:  n * n + 2n + (n)^2 = n^2 + (n^2*n) + nlog(n) = n^3
def largest_contiguous_subsum(arr)
    current_sum = arr.first
    largest_sum = arr.first
    (1...arr.length).each do |i|
        current_sum = 0 if current_sum < 0
        current_sum += arr[i] 
        largest_sum = current_sum if current_sum > largest_sum
    end
    largest_sum
end
# Big(O)=n
    # list = [5, 3, -7, 12]
    # p largest_contiguous_subsum(list) # => 13
#  list = [2, 3, -6, 7, -6, 7]
#     p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])
    # list = [-5, -1, -3]
    # p largest_contiguous_subsum(list) # => -1 (from [-1])

    # # possible sub-sums
    # [5]           # => 5
    # [5, 3]        # => 8 --> we want this one
    # [5, 3, -7]    # => 1
    # [3]           # => 3
    # [3, -7]       # => -4
    # [-7]          # => -7

#BigO:  n * n * 2n * (n)^2 = n^5
