a,b = gets.chomp.split(" ").map(&:to_i)

csum = 1

2.upto(b-a) do |i|
  csum += i
end

puts csum - b