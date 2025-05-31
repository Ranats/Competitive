n,z,w = gets.chomp.split(" ").map(&:to_i)
a = gets.chomp.split(" ").map(&:to_i)

score = [(a[-1]-w).abs]

(n-1).times do |i|
  z = a[i]
  remain_arr = a[i+1..-1]
  score_tmp = []
  remain_arr.each do |num|
    score_tmp << (z - num).abs
  end
  score << score_tmp.min
#  puts "i:#{i} a[i]:#{z} remain_arr:#{remain_arr} score:#{score}\n"
end

puts score.max