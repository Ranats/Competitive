d,n = gets.chomp.split(" ").map(&:to_i)

if n == 100
  puts 100 ** (d+1) + (100**d)
  exit
end

puts 100 ** d * n