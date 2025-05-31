n = gets.to_i

values = gets.chomp.split(" ").map(&:to_i)
costs = gets.chomp.split(" ").map(&:to_i)

xy = values.map.with_index{|v,i| v - costs[i]}

cost = [0]
1.upto(n) do |i|
  cost += xy.combination(i).collect{|arr| arr.inject(:+)}
end

puts cost.max