a,b,c = gets.chomp.split(" ").map(&:to_i)

puts [a,b,c].uniq.count == 1 ? "Yes" : "No"