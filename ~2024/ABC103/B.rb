s = gets.chomp
t = gets.chomp

time = s.size
time.times do
  last = s[-1]
  s.chop!
  s = last + s
  if s == t
    puts "Yes"
    exit
  end
end

puts "No"