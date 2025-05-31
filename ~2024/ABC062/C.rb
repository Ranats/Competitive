h,w = gets.chomp.split.map(&:to_i).sort

def chop(h,w)

end

if h%3==0 || w%3==0
  puts 0
else
  max = (w/2) * h
  min = (w-w/2) * (h/2)
  p max
  p min
  puts max - min
end