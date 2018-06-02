# その数を求めれば良い

n,d = gets.split(" ").map(&:to_i)
x = gets.split(" ").map(&:to_i)

neighbor = []
own = []
1.upto(n) do |i|
  if x[i] - x[0] <= d
    own << i
  else
    break
  end
end

neighbor << own

1.upto(n-1) do |i|

  own = []
  idx = neighbor.find_index{|ne| ne.include?(i)}
  own += [idx] + neighbor[idx]
  own.delete_if{|num| num < idx}

  (own.last+1).upto(n-1) do |j|
    if x[j] - x[i] <= d
      own << j
    else
      break
    end
  end
  neighbor << own - [i]
end

op = 0

(n-3).times do |i|
  (neighbor[i].last + 1).upto(n-1) do |j|
    break if (neighbor[i] & neighbor[j]).size == 0
    op += (neighbor[i] & neighbor[j]).size
  end

end

puts op