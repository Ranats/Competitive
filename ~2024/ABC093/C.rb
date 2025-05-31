arr = gets.chomp.split(" ").map(&:to_i).sort

count = 0

2.times do |i|
  count += (arr[2] - arr[i])/2
  arr[i] += (arr[2] - arr[i])/2 * 2
end

count += case arr.count(arr.min)
           when 1 then 2
           when 2 then 1
           else        0
         end

puts count
