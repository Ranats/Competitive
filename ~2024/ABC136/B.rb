n = gets.chomp

delim = n.size
count = 0
1.upto(delim) do |i|
#  puts "i:#{i} delim:#{delim} i.odd?:#{i.odd?}"
  if i.odd?
#    puts "10**i-1:#{(10**i)-1} n:#{n.to_i}"
    if (10**i) - 1 > n.to_i
      count += n.to_i - (10**(i-1)) +1
      next
    end
    count += (10**i) - (10**(i-1))
  end
end

puts count
