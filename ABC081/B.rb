n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

count = 0
while arr.all?{|num| num.even?}
  arr.map!{|num| num/2}
  count += 1
end

puts count