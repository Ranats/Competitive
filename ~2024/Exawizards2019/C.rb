n,q = gets.chomp.split(' ').map(&:to_i)
s = gets.chomp.split('')

addr = {}

s.each_with_index do |alpha,i|
  addr.has_key?(alpha) ? addr[alpha] << i : addr[alpha] = [i]
end

p addr
left_queue = Array.new(n){[]}

right_queue = Array.new(n){[]}

left_tmp_queue = Array.new(n){[]}

q.times do |i|
  t , d = gets.chomp.split(" ")
  next if addr[t].nil?
  addr[t].each do |j|
    left_queue[j]   << i if d == "L"
    right_queue[j]  << i if d == "R"
  end

end

p left_queue
p right_queue
