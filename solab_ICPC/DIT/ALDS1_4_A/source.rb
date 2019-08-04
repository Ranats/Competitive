n = gets
s = gets.split(" ").uniq

q = gets
t = gets.split(" ")

puts (s & t).size
