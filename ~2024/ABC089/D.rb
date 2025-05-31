h,w,d = gets.split(" ").map(&:to_i)

arr = Array.new(h*w+1,nil)

h.times do |i|
  input = gets.split(" ").map(&:to_i)
  input.each_with_index do |ip,j|
    arr[ip] = {i:i+1, j:j+1}
  end
end

q = gets.to_i

task = []
q.times do
  input = gets.split(" ").map(&:to_i)
  task << {L:input[0], R:input[1]}
end

# 1からh*wまでそれぞれ移動した場合のコスト
cost = Array.new(h*w+1,0)
(1+d).upto(h*w) do |i|
  cost[i] = cost[i-d] + (arr[i][:i] - arr[i-d][:i]).abs + (arr[i][:j] - arr[i-d][:j]).abs
end

task.each do |t|
  puts cost[t[:R]] - cost[t[:L]]
end
exit



=begin
# ｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱｱ
done = {}
mana = Array.new(task.size,0)
x = 0
task.each_with_index do |t,idx|
  mana[idx] = 0

  # 探索済みのタスクかチェック
  if done.has_key?(t)
#    puts "atta"
    mana[idx] = done[t]
  end

#  puts "index : #{arr.index(t[:L])}"
  x = t[:L]

  # L <= R
  # Ri − Li が D の倍数である
  # -> (Ri-Li)/D 回?

  while true

    # 探索終了
    # t[:L] -> t[:R]までの魔力
    if x == t[:R]
      done[t] = mana[idx]
      break
    end

    # 今いる所
    i = arr[x][:i]
    j = arr[x][:j]
#    puts "i : #{i} j : #{j}"

    # 今いる所からゴールまでのルートが探索済みかチェック
    key = {:L=>x,:R=>t[:R]}
    if done.has_key?(key)
      mana[idx] += done[key]
      done[t] = mana[idx]
      break
    end

    x += d
    pos_x = arr[x][:i]
    pos_y = arr[x][:j]

#    puts "x : #{pos_x} y : #{pos_y}"

    mana_t = (pos_x - i).abs + (pos_y - j).abs
    mana[idx] += mana_t

    # t[:L] -> x (スタート→現在地点)までに必要な魔力
    key = {:L=>t[:L],:R=>x}
    done[key] = mana[idx]
    key = {:L=>x-d, :R=>x}
    done[key] = mana_t

  end

end

puts mana
=end