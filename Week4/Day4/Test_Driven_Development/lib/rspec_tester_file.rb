def my_uniq(arr)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if !new_arr.include?(ele)
    end
    new_arr
    
    
end

def two_sum(sample)
    raise 'invalid arg' unless sample.is_a?(Array)
    new_arr = []
    (0...sample.length - 1).each do |i1|
        ((i1 + 1)...sample.length).each do |i2|
            new_arr << [i1, i2] if sample[i1] + sample[i2] == 0
        end
    end
    new_arr
end

p two_sum([0, 0, 1, 2, -2, -3, -1])
p two_sum([0, 0, 0, 4, 3, -3])
