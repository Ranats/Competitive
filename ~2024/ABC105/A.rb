n,k = gets.split(" ").map(&:to_i)
arr = Array.new(k){0}

while n > 0
  k.times do |i|
    arr[i] += 1
    n -= 1
    break if n == 0
  end
end

puts arr.max - arr.min
