n = gets.chomp.to_i #=> d.size
d = Hash.new(0)
gets.chomp.split(" ").each do |i|
  d[i] += 1
end
m = gets.chomp.to_i #=> t.size
t = Hash.new(0)
gets.chomp.split(" ").each do |i|
  t[i] += 1
end

t.each do |k,v|
  if d[k] < v
    puts "NO"
    exit
  end
end

puts "YES"