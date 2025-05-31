### https://beta.atcoder.jp/contests/soundhound2018-summer-qual/tasks/soundhound2018_summer_qual_a

a,b = gets.chomp.split(" ").map(&:to_i)

puts (a+b==15) ? "+" : (a*b==15) ? "*" : "x"
