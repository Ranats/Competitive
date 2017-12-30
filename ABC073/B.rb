n = gets.to_i
seat = 0

n.times do
  input = gets.chomp.split(" ").map(&:to_i)
  seat += input[1] - input[0] + 1
end

puts seat