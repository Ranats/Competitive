n,m,a,b = gets.chomp.split(" ").map(&:to_i)
orange = Array.new(n){b}

m.times do
  l,r = gets.chomp.split(" ").map(&:to_i)
  l.upto(r) do |i|
    orange[i-1] = a
  end
end

puts orange.inject(:+)