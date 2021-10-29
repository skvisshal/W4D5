require 'benchmark'

def my_min_1(list)#O(n^2)
    list.each do |el_1| #O(n)
        return el_1 if list.all? do |el_2| #O(n)
            el_1 <= el_2#O(1)
        end
    end
end

def my_min_2(list)#O(n)
    min = 0#O(1)
    list.each {|el| min = el if el < min}#O(n)
    min#O(1)
end


list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min_1(list)  # =>  -5
my_min_2(list)  # =>  -5

Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                    "Avg. Merge:  ", "Avg. Bubble: ") do |b|
    p merge = b.report("Tot. Merge:  ") { my_min_1(list) }
    p bubble = b.report("Tot. Bubble: ") { my_min_2(list) }
end
