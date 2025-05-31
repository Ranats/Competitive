x,y = gets.chomp.split(" ").map(&:to_i)

if x+y >= 10
  puts "error"
else
  puts x+y
end
