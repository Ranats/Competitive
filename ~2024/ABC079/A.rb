n = gets.chomp.split("")
if (n[1] == n[2] && n[2] == n[3]) || (n[0] == n[1] && n[1] == n[2])
  puts "Yes"
else
  puts "No"
end