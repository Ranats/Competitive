n,m,x,y = gets.chomp.split(" ").map(&:to_i)
arr_x = gets.chomp.split(" ").map(&:to_i)
arr_y = gets.chomp.split(" ").map(&:to_i)

left = [arr_x.max,x].max
right = [arr_y.min,y].min

if right - left > 0
  puts "No War"
else
  puts "War"
end