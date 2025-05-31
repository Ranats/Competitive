q,h,s,d = gets.chomp.split(" ").map(&:to_i)
n = gets.to_i
ans = 0

min_1 = [q*4,h*2,s].min

ans += (n/2) * [q*8,h*4,s*2,d].min
ans += (n%2) * min_1

puts ans