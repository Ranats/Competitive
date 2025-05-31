x,a,b = gets.chomp.split(" ").map(&:to_i)

if (a-x).abs > (b-x).abs
  puts "B"
else
  puts "A"
end
