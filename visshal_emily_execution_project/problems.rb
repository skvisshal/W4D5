require 'benchmark'

# def my_min_1(list)#O(n^2)
#     list.each do |el_1| #O(n)
#         return el_1 if list.all? do |el_2| #O(n)
#             el_1 <= el_2#O(1)
#         end
#     end
# end

# def my_min_2(list)#O(n)
#     min = 0#O(1)
#     list.each {|el| min = el if el < min}#O(n)
#     min#O(1)
# end


# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)  # =>  -5
# my_min_2(list)  # =>  -5

# Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
#                     "Avg. Merge:  ", "Avg. Bubble: ") do |b|
#     p merge = b.report("Tot. Merge:  ") { my_min_1(list) }
#     p bubble = b.report("Tot. Bubble: ") { my_min_2(list) }
# end

def largest_contiguous_subsum_1(list) #O(n^2)
    sub_arr = []                                #O(1)
    (0...list.length).each do |i|               #O(n)
        (i...list.length).each do |j|           #O(n)
            sub_arr << list[i..j]               #O(1)
        end
    end
    max = sub_arr[0].sum                        #O(1)
    sub_arr.each do |sub|                       #O(n)
        max = sub.sum if sub.sum > max          #O(1)
    end
    max                                   #O(n^2 + n)
end

def largest_contiguous_subsum_2(list)               #O(n)
    largest_sum = list[0]                           #O(1)
    current_sum = list[0]                           #O(1)
    (1...list.length).each do |i|                   #O(n)
        current_sum = 0 if current_sum < 0          #O(1)
        current_sum += list[i]                      #O(1)
        largest_sum = current_sum if current_sum > largest_sum  #O(1)
    end
    largest_sum                                     #O(1)
end

list = [5, 3, -7]
p largest_contiguous_subsum_2(list) # => 8

# possible sub-sums
[5]           # => 5
[5, 3]        # => 8 --> we want this one
[5, 3, -7]    # => 1
[3]           # => 3
[3, -7]       # => -4
[-7]          # => -7

list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum_2(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum_2(list) # => -1 (from [-1])

Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                    "Avg. Merge:  ", "Avg. Bubble: ") do |b|
    p merge = b.report("Tot. Merge:  ") { largest_contiguous_subsum_1(list) }
    p bubble = b.report("Tot. Bubble: ") { largest_contiguous_subsum_2(list) }
end