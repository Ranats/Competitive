n,h = gets.chomp.split(" ").map(&:to_i)
attack = []
n.times do
  attack << gets.chomp.split(" ").map(&:to_i)
end

# 普通に攻撃するなら振る攻撃力が高いものを使うのが吉．
# 投げつけるなら，投げつける攻撃力が高いものから順に投げつけるのが吉．

# 何度か殴って，順番に投げる
# 攻撃回数を最小にしたい．
# 何個まで投げるか：k
# 目標値から投げる分引いた分だけ殴る
#   0 ≦ k ≦ N を全部試す

attack.sort_by!{|atk| atk[1]}.reverse!
swing_max = attack.max_by{|atk| atk[0]}[0]
ans = h / swing_max + 1

(n+1).times do |k|

  # k個投げる
  if k > 0
    h -= attack[k-1][1]
  end

  # 殴る回数
  cnt = 0
  if h > 0
    cnt = (h+swing_max-1)/swing_max
  end

  ans = [ans,cnt+k].min
end

puts ans