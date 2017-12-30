x,y = gets.chomp.split(" ").map(&:to_i)
arr = [x]
while true
  if arr.last * 2 <= y
    arr << arr.last * 2
  else
    break
  end
end

puts arr.size