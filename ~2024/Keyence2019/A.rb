n = gets.chomp.split("").map(&:to_i).uniq

if n.count(1) + n.count(9) + n.count(7) + n.count(4) == 4
  puts "YES"
else
  puts "NO"
end