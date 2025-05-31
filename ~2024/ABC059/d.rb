x, y = gets.chomp.split(" ").map(&:to_i)

stone = {x:x,y:y}

count = 1

count2 = 0
res1 = ""

def result(count)
  if count < 0
    return "Alice"
  else
    return "Brown"
  end
#  exit
end

flg = true
while flg
  count2 += 1
  puts "now : Alice" if count > 0
  puts "now : Brown" if count < 0


  sel = (stone[:x] >= stone[:y]) ? ((stone[:x]/2 > 0) ? :x : :y) : (stone[:y]/2 > 0) ? :y : :x
  puts %(sel:#{sel} , stone[#{sel}]:#{stone[sel]})
  if stone[sel] / 2 == 0
    res1 = result(count)
    break
#    flg = false
  end

  pick = 2 * (stone[sel]/2)
#  puts %(pick:#{pick})

  if sel == :x
    stone[:x] -= pick
    stone[:y] += pick/2
  else
    stone[:y] -= pick
    stone[:x] += pick/2
  end

  puts %(x:#{stone[:x]} y:#{stone[:y]})
  count *= -1
end

puts "win : #{res1} \n"

stone = {x:x,y:y}

count = 1
count3 = 0
res2 = ""

flg = true

while flg
  count3 += 1
  puts "now : Alice" if count > 0
  puts "now : Brown" if count < 0


  sel = (stone[:x] <= stone[:y]) ? ((stone[:x]/2 > 0) ? :x : :y) : (stone[:y]/2 > 0) ? :y : :x
  puts %(sel:#{sel} , stone[#{sel}]:#{stone[sel]})
  if stone[sel] / 2 == 0
    res2 = result(count)
    break
    #flg = false

  end

  pick = 2 * (stone[sel]/2)
#  puts %(pick:#{pick})

  if sel == :x
    stone[:x] -= pick
    stone[:y] += pick/2
  else
    stone[:y] -= pick
    stone[:x] += pick/2
  end

  puts %(x:#{stone[:x]} y:#{stone[:y]})
  count *= -1
end

p count2,count3,res1,res2
if count2 < count3
  puts res1
else
  puts res2
end
