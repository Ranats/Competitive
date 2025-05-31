### https://beta.atcoder.jp/contests/abc101/tasks/abc101_c

def limit(n,k)
  1.upto(n){|i| return i if (k*i)-(i-1) >= n}
end

n, k = gets.chomp.split(" ").map(&:to_i)
arr = gets

puts limit(n,k)