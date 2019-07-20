def gcd(x,y)
  loop do
    r = x % y
    return y if r == 0
    x, y = y, r
  end
end

w,h,c = gets.chomp.split(" ").map(&:to_i)

puts w * h * c / gcd(w,h) ** 2
exit


min = [w,h].min
max = [w,h].max

1.upto(min) do |row|
  if max % min == 0
    puts c * (max/min) * row
    exit
  end
  if min % 2 == 0
    min /= 2
  else
    min = 1
  end
end