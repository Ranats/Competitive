n = gets.chomp.to_i

arr = []
n.times do
  arr << gets.split(" ").map(&:to_i)
end

last = arr.max_by{|arr| arr[0]}

puts last[0] + last[1]
