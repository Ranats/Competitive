N,T = gets.chomp.split(" ").map(&:to_i)
t = gets.chomp.split(" ").map(&:to_i)

time = 0
t.each do |oyu|
  if oyu < time
    time -= time-oyu
  end
  time += T
end

puts time