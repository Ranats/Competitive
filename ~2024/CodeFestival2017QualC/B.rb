n = gets.chomp.to_i #=> d.size
a = gets.chomp.split(" ").map(&:to_i)
arr = []
a.each do |i|
  arr << [i-1,i,i+1]
end

if a.size == 1
  puts a[0] % 2 == 0 ? "1" : "2"
  exit
end

cp = []
arr.each_with_index do |carr,i|
  if i == 0
    cp = carr
  else
    cp = cp.product(carr)
  end
end

cp.each do |c|
  c.flatten!
end

count = 0
cp.each do |arr|
  if arr.count{|item| item % 2 == 0} > 0
    count += 1
  end
end

puts count

#puts cp.count do |arr|
#  arr.count{|item| item % 2 == 0} > 0
#end
