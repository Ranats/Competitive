n = gets.to_i
s = gets.chomp.split("")
=begin
# 想定解?
max = 0
1.upto(n) do |i|
  hash = {}
  s[0...i].each do |si|
    if hash[si].nil?
      hash[si] = 1
    end
  end

  count = 0
  s[i..-1].each do |si|
    count += 1 unless hash[si].nil?
  end

  max = [count,max].max
end
puts max
=end

max = 0
1.upto(n) do |i|

  first = s[0...i].uniq.sort
  last = s[i..-1].uniq.sort
  num = first.size - (first - last).size
  max = [max, num].max
end

puts max