### https://beta.atcoder.jp/contests/abc101/tasks/abc101_b

n = gets
s_n = n.split("").map(&:to_i).inject(:+)

puts (n.to_i%s_n == 0) ? "Yes" : "No"