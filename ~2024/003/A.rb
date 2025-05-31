input = gets.chomp
n = input.count("N")
s = input.count("S")
e = input.count("E")
w = input.count("W")

if n == 0
  unless s == 0
    puts "No"
    exit
  end
else # n > 0
  unless s <= n && s > 0
    puts "No"
    exit
  end
end

if e == 0
  unless w == 0
    puts "No"
    exit
  end
else # n > 0
  unless w <= e && w > 0
    puts "No"
    exit
  end
end

puts "Yes"