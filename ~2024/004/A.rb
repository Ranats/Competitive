a,b,c = gets.chomp.split(' ').map(&:to_i)

cube = [a,b,c].sort!

red = cube[0] * (cube[1]) * (cube[2]/2)

blue = a * b * c - red

p (red - blue).abs