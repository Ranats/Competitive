a,b,c = gets.chomp.split(" ").map(&:to_i)
arr = [a,b,c].sort

puts arr[0]+arr[1]