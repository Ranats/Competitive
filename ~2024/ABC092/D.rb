# 100x100のボードを作り，縦に割る．
# 左右それぞれを白と黒で分ける
# →連結成分は1,1
# 左右に1マス開けて入れたい分だけ逆の色を置く

a,b = gets.split(" ").map(&:to_i)

cell = Array.new(100){Array.new(50,".") + Array.new(50,"#")}

(a-1).times do |i|
  cell[i/25 *2][(i%25)*2+51] = "."
end

(b-1).times do |i|
  cell[i/25 *2][(i%25)*2] = "#"
end

puts "100 100"

cell.each do |line|
  puts line.join("")
end