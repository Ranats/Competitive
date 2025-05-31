def bs(books, sw)
  d = 1
  rest = sw
  books.each do |bw|
    return Float::INFINITY if bw > sw
    if rest < bw
      d += 1
      rest = sw - bw
    else
      rest -= bw
    end
  end
  return d
end

loop do
  m,n = gets.chomp.split(" ").map(&:to_i)
  break if [m,n] == [0,0]

  books = []
  shelf = Array.new(m,0)
  n.times do
    books << gets.to_i
  end

  l = 1
  r = books.max
  min = Float::INFINITY
  loop do
    mid = (l + r) / 2
    if bs(books,c) <= m
      min = mid
      r = mid - 1
    else
      l = mid + 1
    end
  end

  puts min
end
