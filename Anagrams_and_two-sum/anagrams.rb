def first_anagram?(str1, str2)
    subs = []
    (0...str1.length).each do |i|
        (i...str1.length).each do |j|
            subs << str1[i..j]
        end
    end
    subs.include?(str2)

end
# O(n!) combinatorial time
# O(n!) combinatorial space
def first_anagram?(str1, str2)
  str1.split('').permutation.to_a.include?(str2.split(''))
end


# def all_anagrams(string)
#   return [string] if string.length <= 1
#   prev_anagrams = all_anagrams(string[0...-1])
#   new_anagrams = []

#   prev_anagrams.each do |anagram|
#     (0..anagram.length).each do |i|
#       new_anagrams << anagram.dup.insert(i, string[-1])
#     end
#   end

#   new_anagrams
# end

str1 = "ulfeex"
str2 = "ulfeex"
p first_anagram?(str1, str2)

# Big(O) = n * n * 2n = n^3


def second_anagram?(str1, str2)
    (0...str1.length).each do |i|
        index = str2.index(str1[i])
        return false if index == nil
        str2.slice!(index)

        # str2.delete_at(index)
    end
    str2.empty?
end

# str1 = "ulfeex"
# str2 = "ulfee"
# p second_anagram?(str1, str2)

#Big(O) = n * n = n^2


def third_anagram?(str1,str2)
    alpha = ("a".."z").to_a
    sorted1 = str1.split("").sort
    sorted2 = str2.split("").sort
    sorted1 == sorted2
end
#Big(O): nlog(n) + mlog(m) + n = nlog(n)
str1 = "ulfee"
str2 = "ulfee"
p third_anagram?(str1, str2)

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    # count2 = Hash.new(0)
    str1.each_char do |char|
        count1[char] += 1
    end
    
    str2.each_char do |char|
        count1[char] -= 1
    end
    count1.values.all? {|ele| ele == 0}
end
#Big(O): n + m + n = n
str1 = "ulfexx"
str2 = "ulfeex"
p fourth_anagram?(str1, str2)