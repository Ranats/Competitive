n,h = gets.chomp.split(" ").map(&:to_i)
attack = []
n.times do
  attack << gets.chomp.split(" ").map(&:to_i)
end

# 強いのから振る
# 強いのから投げる
# ある刀は振る<=投げる
# 他の刀の投げるより強い振るの場合，投げる必要ない
#
# 強い順にソート
# 振るより投げるが強い場合，そこまで投げた場合の合計ダメージになるまで殴る



attack.delete_if {|atk| attack.any?{|at| at[0] > atk[1]} }

#p attack

throw_total = 0
swing_max = attack[0][0]
attack.each do |atk|
  throw_total += atk[1]
  if atk[0] > swing_max
    swing_max = atk[0]
  end
end

remain_hp = (h - throw_total)

ans = 0

#puts "h-throw_total :#{h} - #{throw_total} = #{h-throw_total}"
#puts "ans : #{remain_hp}"

if remain_hp > 0
  ans += remain_hp / swing_max
  h -= ans * swing_max
  if remain_hp % swing_max > 0
    ans += 1
    h -= swing_max
  end
else
  ans = 0
end

h -= throw_total
ans += attack.size

puts ans