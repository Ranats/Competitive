n = gets.chomp.to_i
cards_p = []
$count = 0
n.times do |i|
  cards_p << gets.chomp.to_i
end
#cards_p.flatten!

#p cards_p

tmp = 0

0.upto(n-1) do |idx|
#  p cards_p
  arr = cards_p[idx] + tmp
#  puts %(arr:#{arr})
#  puts ""
  if arr % 2 == 0
    $count += arr/2
  else
    $count += arr/2
    if idx < n-1
      unless cards_p[idx+1] == 0
        tmp = 1
        next
      end
    end
#    unless cards_p[idx+1].empty?
#      cards_p[idx+1].unshift arr.last
#    end

  end
  tmp = 0
end

puts $count

=begin
def search(cards)
  if cards.size <= 1
    return
  end
#  p cards
#  0.upto(cards.size-2) do |idx|
#    puts %(#{idx},#{idx+1})
#    puts %(#{cards[idx]},#{cards[idx+1]})

    if (cards[0] - cards[1]).abs <= 1
      $count += 1
      cards.delete_at(0)
      cards.delete_at(0)
#      p cards
#      gets
#      break
#      search(cards)
    else
      cards.delete_at(0)
    end

#    p cards
#  if (a - b).abs <= 1
#    count += 1
#  end
#  end
  search(cards)
end

cards_p.size.times do
  search(cards_p)
end

puts $count
#p cards_p

=end