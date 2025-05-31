### https://beta.atcoder.jp/contests/abc102/tasks/abc102_c
# 中央値！

n = gets.to_i
arr = gets.split(" ").map.with_index{|x,i| x.to_i-(i+1)}.sort

median = if n % 2 == 0
           (arr[(n/2)-1] + arr[(n/2)]) / 2
         else
           arr[(n/2)]
         end

puts arr.inject(0){|sum,x| sum + (x-median).abs}