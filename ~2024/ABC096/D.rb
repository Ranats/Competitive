# 5個選んだ合計が合成数
# => 1の位の合計が 0,5 なら素数ではない = 合成数
# => [0,5].include? (n%10)*5
# => 1の位がぜんぶ同じ組み合わせ

#   …が 5 <= N <= 55 の数だけ存在する保証？

require "prime"
prime = Prime.each(55555).to_a

n = gets.to_i

arr = []
1.upto(10) do |i|
  arr = prime.select{|num| num % 10 == i}.take(n)
  break if arr.size == n
end

puts arr.join(" ")