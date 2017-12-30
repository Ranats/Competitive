class Array
  def swap!(a,b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

n = gets.chomp.to_i
arr = gets.chomp.split(" ").map(&:to_i)

count = 0

(n-1).times do |i|
  if arr[i] == i+1
    arr.swap!(i,i+1)
    count += 1
  end
end

if arr[n-1] == n
  arr.swap!(n-2,n-1)
  count +=1
end

puts count
