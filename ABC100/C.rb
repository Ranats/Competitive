# どれかを必ず2で割らなければならない
# => 何回2で割れるか，の合計
# 3を何回掛けても，2で割れる回数は変わらない

def division2(x,i)
  x % 2 != 0 ? i : division2(x/2,i+1)
end

n = gets.to_i
seq = gets.chomp.split(" ").map(&:to_i)

p seq.inject(0){|sum,a| sum + division2(a,0)}