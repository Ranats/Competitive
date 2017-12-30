a,b = gets.chomp.split(" ").map(&:to_i)
str = gets.chomp

if str.size >= a && str.size <= b
  puts "YES";exit;
end
puts "NO"