### https://beta.atcoder.jp/contests/abc101/tasks/abc101_c

n, k = gets.chomp.split(" ").map(&:to_i)
arr = gets.chomp.split(" ").map(&:to_i).sort

if k == 2
  puts n-1
  exit
end

if n == k
  puts 1
  exit
end

if n * 2 == k
  puts 3
  exit
end

if n/k == 1
  puts 2
  exit
end

2.upto(n) do |i|
  if (k * i) - (i-1) >= n
    puts i
    exit
  end
end
