n = gets.to_i
p = gets.chomp.split(" ").map(&:to_i)

count = 0
p.each_cons(3) do |arr|
  if (arr[0] < arr[1] && arr[1] < arr[2]) || (arr[2] < arr[1] && arr[1] < arr[0])
    count += 1
  end
end

puts count