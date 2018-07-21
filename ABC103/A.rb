input = gets.chomp.split(" ").map(&:to_i)
idx = [0,1,2]
cost = []

3.times do |i|
  focus = idx - [i]
  cost << (input[focus[0]] - input[i]).abs + (input[focus[1]] - input[focus[0]]).abs
  cost << (input[focus[1]] - input[i]).abs + (input[focus[0]] - input[focus[1]]).abs
end

puts cost.min