n,x = gets.split(" ").map(&:to_i)
s = gets.split("").map(&:to_i)
t = []
sum = 0
n.times do |i|
  t = gets.to_i
  if s[i] == 1 && t > x
    sum += x
  else
    sum += t
  end
end

puts sum
