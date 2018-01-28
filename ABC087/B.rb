a = gets.to_i
b = gets.to_i
c = gets.to_i
x = gets.to_i


coin500 = [*0..a]
coin100 = [*0..b]
coin50 = [*0..c]

puts coin500.product(coin100,coin50).collect{|arr| arr[0]*500 + arr[1]*100 + arr[2]*50}.select{|num| num == x}.size

exit



count = 0

if x == 50
  if c == 0
    puts 0
    exit
  end
  puts 1
  exit
end

if x == 100
  if b > 0
    count += 1
    if c == 2
      count += 1
    end
    puts count
    exit
  end
  if c == 2
    puts 1
    exit
  end
  puts 0
  exit
end

if x < 500
  coins = [0,0]

  if x % 100 == 50
    if c > 0
      coins[1] = 1
    else
      puts 0
      exit
    end
  end
  one_hundred = x / 100
  coins[0] = [one_hundred,b].min
  if one_hundred > b
    over = one_hundred - b
    if over > 0
      if c-coins[1] < over*2
        puts 0
        exit
      end
      coins[1] += over*2
    end
  end

  count = 1
  exchangeable = (c - coins[1]) / 2
  count += [coins[0],exchangeable].min
  puts count
  exit
end

coins = [0,0,0]

if x % 100 == 50
  if c > 0
    coins[2] = 1
  else
    puts 0
    exit
  end
end

five_hundred = x / 500
coins[0] = [five_hundred,a].min
if five_hundred > a
  over = five_hundred - a
  coins[1] = [over*5,b].min
  if over*5 > b
    over_c = over*5 - b
    coins[2] = [over_c*2,b].min
    if over_c*2 > b
      puts 0
      exit
    end
  end

else
  one_hundred = (x-(five_hundred*500)) / 100
  coins[1] = [one_hundred,b].min
  if one_hundred > b
    over = one_hundred - b
    if over > 0
      if c-coins[2] < over*2
        puts 0
        exit
      end
      coins[2] += over*2
    end
  end

end

count = 1

p coins
1.upto(coins[0]) do |i|
  if i*10 <= c
    count += 1
  end
  if i*5 <= b
    count += 1
    1.upto(i) do |j|
      puts "[#{12-i},#{i*5},#{j*2}]"
      if j*2 > c
        next
      end
      count += 1
    end
  end
end

p count

exchangeable = (b - [coins[1],0].max) / 5
p exchangeable
count += [coins[0],exchangeable].min
#ex2 = (b - [coins[0],exchangeable].min) / 2

exchangeable = (c - [coins[2],0].max) / 10
p exchangeable
count += [coins[0],exchangeable].min
exchangeable = (c - [coins[2],0].max) / 2
p exchangeable
count += [coins[1],exchangeable].min

puts count
exit







if x >= 500
  # 全部500円玉
  five_hundred = x / 500 #=>12
  if five_hundred > a
    five_hundred = a
    one_hundred = (x - five_hundred*500) / 100
    if one_hundred > b
      one_hundred = b
      fifty = (x-(five_hundred*500 + one_hundred*100))/50
      if fifty > c
        puts 0
        exit
      end
    end
  end
  count += five_hundred

  # 100円玉に置換
  one_hundred = b / 5   #=> 8
  if one_hundred > five_hundred
    one_hundred = five_hundred
  end
  if one_hundred > b
    one_hundred = b
  end
  count += one_hundred

  # 500->50円玉に置換
  fifty = c / 10 #=> 5
  if fifty > five_hundred
    fifty = five_hundred
  end
  count += fifty

  # 100->50
  fifty = c / 2
  if fifty  > one_hundred
    fifty = one_hundred
  end
  count += fifty

  puts count
  exit
end

if x >= 100
  one_hundred = x / 100 #=>1
  if one_hundred > b
    one_hundred = b
  end
end