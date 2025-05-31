def solve(arr,num,a,b)

  l = 0
  r = arr.size-1
  count = 0
  while l < arr.size && r >= 0
    if a.include?(arr[l])
      l += 1
      next
    end

    if b.include?(arr[r])
      r -= 1
      next
    end

    if arr[l] * arr[r] < num
      count += 1
      a << arr[l]
      b << arr[r]
    else
      r -= 1
    end
  end

  return count
end

q = gets.to_i

q.times do
  a,b = gets.chomp.split(" ").map(&:to_i)
  score = a*b
  a = [a]
  b = [b]

  arr = [*1..score]

  count = solve(arr,score,a,b)

  puts count
end