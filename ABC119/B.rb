n = gets.chomp.to_i
otoshidama = 0
n.times do
  x, u = gets.chomp.split(" ")
  x = x.to_f
  if u == 'BTC'
    x *= 380000.0
  end
  otoshidama += x
end

puts otoshidama