$n,$y = gets.chomp.split(" ").map(&:to_i)

arr = []

($n+1).times do |n|
  ($n+1 - n).times do |n2|
    arr << [n,n2,($n-n-n2)]
  end
end


arr.each do |ar|
  if ar[0]*10000 + ar[1]*5000 + ar[2]*1000 == $y
    puts ar.join(" ")
    exit
  end
end

puts "-1 -1 -1"
exit






bill = {10000 => 0,5000 => 0,1000 => 0}

total = 0

def solve(bill,m)

  m[bill] += 1
  total = m[10000]*10000 + m[5000]*5000 + m[1000]*1000

  puts "total : #{total}  bill:#{bill}  m:#{m}"

  if total > $y
    total -= bill
    m[bill] -= 1
    return
  end

  if m[10000] + m[5000] + m[1000] > $n
    total -= bill
    m[bill] -= 1
    return
  end

  if total == $y
    if m[10000] + m[5000] + m[1000] == $n
      puts total
      puts m[10000]*10000 + m[5000]*5000 + m[1000]*1000
      puts "#{m[10000]} #{m[5000]} #{m[1000]}"
      exit
    else
      m[bill] -= 1
      return
    end
  end

  solve(1000,m)
  solve(5000,m)
  solve(10000,m)
end

if $y >= 10000
  solve(10000,bill)
elsif $y >= 5000
  solve(5000,bill)
else
  solve(1000,bill)
end

=begin
3.times do |i|
  puts "bill: #{bill[i]}"
  while total + bill[i] <= y
    total += bill[i]
    ans[i] += 1

    puts "total: #{total}"

    if total == y
      diff = n - ans.inject(&:+)
      if diff == 0
        puts ans.join(" ")
        exit
      else
        if diff > 0
          if diff % 4 == 0

          end
        end
      end
    end

  end
end

=end
puts "-1 -1 -1"