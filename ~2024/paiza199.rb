h,w = gets.chomp.split(" ").map(&:to_i)
y,x = gets.chomp.split(" ").map{|i| i.to_i.pred}

direction = 0

s = []
h.times do
  s << gets.split("")
end

while x.between?(0, w-1) && y.between?(0, h-1) do
  if s[y][x] == "."
    s[y][x] = "*"
    direction += 1
  else
    s[y][x] = "."
    direction -= 1
  end
  case (direction % 4).abs
    when 0
      y -= 1
    when 1
      x += 1
    when 2
      y += 1
    when 3
      x -= 1
  end
end

s.each do |line|
  puts line.join
end
