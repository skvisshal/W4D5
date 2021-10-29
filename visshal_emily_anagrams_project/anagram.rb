require "benchmark"

def first_anagram?(string_1, string_2) 
    anagrams = anagram_recursive(string_1)
    anagrams.include?(string_2)
end

def anagram_recursive(str)                                                      #O(n! * n^2)
    return [str] if str.length <= 1                                             #O(1)                                             
    
    first_char = str[0]                                                         #O(1)
    rest_of_str = str[1..-1]                                                    #O(1)
    prev_array = anagram_recursive(rest_of_str)                                 #O(n!)
    perms = []                                                                  #O(1)
    prev_array.each do |prev_str|                                               #O(n)
        (0..prev_str.length).each do |index|                                    #O(n)
            perms << prev_str[0...index] + first_char + prev_str[index..-1]     #O(1)
        end
    end

    perms                                                                       #O(1)
end

def second_anagram?(string_1,string_2)          #O(n^2 + n) = #O(n^2)
    str_array = string_2.split("")              #O(n)
    string_1.each_char do |char|                #O(n)
        str_index = str_array.find_index(char)  #O(n)
       if str_index == nil                      #O(1)
            return false
       else
            str_array.delete_at(str_index)      #O(1)
       end
    end
    str_array.empty?                            #O(1)
end


def third_anagram?(str_1, str_2) #O(n log n)
    str1_arr = str_1.split("").sort  #O(n) + O(n log n)
    str2_arr = str_2.split("").sort  #O(n) + O(n log n)
    str1_arr == str2_arr             #O(1)
end

p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true

def fourth_anagram?(str1, str2) #O(n)
    hash = Hash.new(0)                                  #O(1)
    return false if str1.length != str2.length          #O(1)

    (0...str1.length).each do |i|                       #O(n)
        hash[str1[i]] += 1                              #O(1)
        hash[str2[i]] += 1                              #O(1)
    end

    hash.each do |k,v|                                  #O(n)
        return false if v % 2 != 0                      #O(1)
    end
    true
end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true

Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                    "Avg. Merge:  ", "Avg. Bubble: ") do |b|
    p ana_1 = b.report("Tot. Merge:  ") { first_anagram?("elvis", "lives") }
    p ana_2 = b.report("Tot. Bubble: ") { second_anagram?("elvis", "lives") }
    p ana_3 = b.report("Tot. Bubble: ") { third_anagram?("elvis", "lives") }
    p ana_4 = b.report("Tot. Bubble: ") { fourth_anagram?("elvis", "lives") }
end

