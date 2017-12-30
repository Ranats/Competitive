n = gets.chomp.to_i
t = gets.chomp.split(" ").map(&:to_i)
v = gets.chomp.split(" ").map(&:to_i)

v << 0

time_all = t.inject(&:+)

alpha = 1
speed = 0

d = 0.0

i = 0
next_term = t[0]
time_all.times do |time|  #=> 0,1,2,3,...
  # 0 s -100 + 0 = -100 >= 0 false
  # 69s -31 + 30 = -1 >= 0 false
  # 70s -30 + 30 = 0  >= 0 true
  # 71s -29 + 29 = 0
  if ((next_term - time) * -1) + speed >= v[i+1]
    alpha = -1
    speed += alpha
  elsif speed < v[i]
    alpha = 1
    speed += alpha
  end

  d += speed

#  puts "time:#{time} speed:#{speed} d:#{d}"

  if time >= next_term
    i += 1
    next_term += t[i]
  end
end

puts d

# t1
# v1