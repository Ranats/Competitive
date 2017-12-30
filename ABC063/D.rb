n = gets.chomp.to_i
arr = gets.chomp.split(" ").map(&:to_i)
n.times do |i|
  if i.even?
    min_i = arr.index(arr.min)
    arr.delete_at(min_i)
  else
    max_i = arr.rindex(arr.max)
    arr.delete_at(max_i)
  end
end

score = arr[0...n].inject(&:+) - arr[n..2*n].inject(&:+)
puts score