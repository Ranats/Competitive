n = gets.to_i

h,t = 0,0

n.times do
  input = gets.split(" ")
  if input[0] == input[1]
    h += 1
    t += 1
    next
  end
  if input[0] > input[1]
    h += 3
  else
    t += 3
  end
end

puts "#{h} #{t}"
