n = gets.to_i
a = gets.chomp.split(" ").map(&:to_i)
b = gets.chomp.split(" ").map(&:to_i)

diff = a.map.with_index{|x,i| x - b[i]}.sort#.inject(&:+)


minus = diff.select{|x| x < 0}
plus = diff.select{|x| x >= 0}

sum = minus.inject(&:+)
sum_p = plus.inject(&:+)
if sum.nil?
  puts "0"
  exit
end

if sum_p.nil?
  puts "-1"
  exit
end

if sum + sum_p < 0
  puts "-1"
  exit
end

i = 0
while sum < 0
  i += 1
  sum += diff[-i]
end

puts minus.size + i