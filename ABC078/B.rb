x,y,z = gets.split(" ").map(&:to_i)

x -= y+(z*2)
puts x / (y+z) + 1