n,k = gets.chomp.split(" ").map(&:to_i)
x = gets.chomp.split(" ").map(&:to_i)

def greed(query)
  min = query[0]
  max = query[-1]
  mina = min.abs

  if min >=0
    return max
  end

  if max <= 0
    return mina
  end

  return [max,mina].min * 2 + [max,mina].max
end


now = n
x.each_with_index do |x,idx|
  if x >= 0
    now = idx
    break
  end
end

count = []
start = [now - k, 0].max
loop do
  if start > now || start + k > n
    break
  end
  query = x[start...start+k]
  count << greed(query)
  start += 1
end

puts count.min

