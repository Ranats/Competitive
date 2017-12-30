n = gets.chomp.to_i
arr = gets.chomp.split(" ").map(&:to_i)

dict = {}
arr.each do |num|
  if dict[num].nil?
    dict[num] = 1
  else
    dict[num] += 1
  end
end

count = 0
dict.each do |h|
  count += h[1] - h[0] if h[0] < h[1]
  count += h[1] if h[0] > h[1]
end

puts count