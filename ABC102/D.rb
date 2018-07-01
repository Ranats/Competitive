### https://beta.atcoder.jp/contests/abc101/tasks/abc101_c

n = gets.to_i
arr = gets.split(" ").map(&:to_i)

cusum = [arr[0]]

arr[1..-1].each do |x|
  cusum << cusum.last + x
end

p cusum

cut = n / 2

left = arr[0...cut]
right = arr[cut..-1]

p left
p right

cut_l = 0
buff = 1000000000
1.upto(left.size) do |i|
  diff = ((cusum[cut-1]-cusum[i-1])-cusum[i-1]).abs
  if buff > diff
    cut_l = i
    buff = diff
  end
  puts "cusum[cut-1]-cusum[i]:#{cusum[cut-1]-cusum[i-1]}  cusum[i]:#{cusum[i-1]}"
  puts "diff:#{diff}"
end
p cut_l

first = left[0...cut_l]
second = left[cut_l...cut]

p first
p second

cut_r = 0
buff = 1000000000
(cut+1).upto(n-1) do |i|
  l = cusum[i-1] - cusum[cut-1]
  r = cusum[-1] - cusum[i-1]
  diff = (r-l).abs
  if buff > diff
    cut_r = i
    buff = diff
  end
  puts "l :#{l} r:#{r}"
  puts "cusum[-1]-cusum[i]:#{cusum[-1]-cusum[i-1]}  cusum[i]:#{cusum[i-1]}"
  puts "diff:#{diff}"
end

p cut_r
third = arr[cut...cut_r]
fourth = arr[cut_r..-1]

p third
p fourth

sum = [first,second,third,fourth].map{|x| x.inject(:+)}

p sum
puts (sum.max - sum.min).abs