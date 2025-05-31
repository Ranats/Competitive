n = gets.to_i
s = gets.chomp.split('')

puts s.count('R') > n/2 ? "Yes" : "No"