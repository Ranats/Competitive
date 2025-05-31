s = gets.chomp

rem = s.delete("x")
if rem != rem.reverse
  puts "-1"
  exit
end

bit = rem.size / 2
first = []
last = []
index = 0
s.split("").each do |c|
  if c != "x"
    index +=1
  end
  if index <= bit
    first << c
  else
    last << c
  end
end

#p first
last.reverse!

if rem.size % 2 != 0
  last.slice!(-1)
end

#p last

i = 0
im = 0
count = 0
while true
  if first[i] != last[i]
    if first[i] != "x"
      first.insert(i,"x")
    elsif last[i] != "x"
      last.insert(i,"x")
    end
    count += 1
  end
  i+=1
#  puts "----------"
#  p first
#  p last
  if first == last
    break
  end
#  gets
end
puts count
exit