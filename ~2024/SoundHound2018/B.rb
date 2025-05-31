### https://beta.atcoder.jp/contests/soundhound2018-summer-qual/tasks/soundhound2018_summer_qual_b

s = gets.chomp.split("")
w = gets.to_i

puts s.each_slice(w).map{|x|x[0]}.join
