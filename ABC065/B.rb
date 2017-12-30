n = gets.chomp.to_i
button = []

n.times do |i|
  button << gets.chomp.to_i-1
end

set = button.first
# n回遷移して，ゴールに辿り着けなかったら-1 ．
n.times do |i|
  if set == 1
    puts i+1
    exit
  end
  set = button[set]
end

puts "-1"