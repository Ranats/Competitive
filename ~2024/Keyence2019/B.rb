s = gets.chomp

keyence = "keyence".split("")

#left
s.split("").each do |c|
  if c == keyence.first
    keyence.shift
  else
    break
  end
end

#right
if s.end_with?(keyence.join)
  puts "YES"
else
  puts "NO"
end
