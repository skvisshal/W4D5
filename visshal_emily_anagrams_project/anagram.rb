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


p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true