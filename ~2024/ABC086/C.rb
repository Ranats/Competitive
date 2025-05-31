n = gets.to_i
plans = []
n.times do
  plans << gets.chomp.split(" ").map(&:to_i)
end

# ある秒のときの地点から+n秒でイケる地点を列挙？
# その座標の|x|+|y|以上の時刻でn%(|x|+|y|) == 0 なら行ける？

now = [0,0]
t = 0
plans.each do |plan|
  dt = plan[0] - t
  dx = plan[1] - now[0]
  dy = plan[2] - now[1]

  if dt % (dx.abs + dy.abs) != 0
    puts "No"
    exit
  end

  t = plan[0]
  now = [plan[1],plan[2]]
end

puts "Yes"