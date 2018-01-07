n = gets.chomp.to_i
d = []
n.times do
  d << gets.chomp.to_i
end

puts d.uniq.size