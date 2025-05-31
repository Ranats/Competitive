a,b = gets.chomp.split(" ").map(&:to_i)

if b >= a
  count = a
else
  count = a-1
end

puts count