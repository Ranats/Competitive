n = gets.to_i
city = [0] + gets.chomp.split(" ").map(&:to_i) + [0]

# 連続
cost2 = [0]
# 一つ飛ばし
cost3 = []
i = 0
city.each_cons(2) do |c1,c2|
  cost2 << cost2[i] + (c1 - c2).abs
  cost3 << (city[i] - city[i+2]).abs if i < n
  i+=1
end

n.times do |i|

  cost = cost2[i]
  cost = 0 if cost.nil?

  cost += cost3[i]

  cost += cost2.last - cost2[i+2]
  c2 = 0 if c2.nil?

  puts cost
end