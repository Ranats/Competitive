n = gets.chomp.to_i
seq = []
n.times do
  seq << gets.chomp.to_i
end

#p seq

# minが奇数番目にあれば0
# 本来の位置の奇数偶数番目がずれている個数が操作１の回数

count = 0
sorted = seq.sort
0.step(n-1,2) do |num|
  target = seq[num]
#  puts %(target:#{target})
#  p sorted.index(target)
  if sorted.index(target) % 2 != 0
    count += 1
  end
end
puts count