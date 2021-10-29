def bad_two_sum?(arr, target_sum)      #O(n^2)                         
    (0...arr.length-1).each do |i|                  
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

def okay_two_sum?(arr, target_sum)          #O(n log n)
    arr.sort!                               #O(n log n)
    left = 0
    right = arr.length - 1
    while left < right                      #O(n)
        if arr[left] + arr[right] > target_sum
            right -= 1
        elsif arr[left] + arr[right] < target_sum
            left += 1
        else
            return true
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr, target_sum)
    hash = Hash.new(0)
    arr.each do |ele|
        hash[ele] += 1
    end
    


end

arr = [0, 1, 5, 7]
p two_sum?(arr, 6) # => should be true
p two_sum?(arr, 10) # => should be false






