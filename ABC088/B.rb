n = gets.to_i
cards = gets.split(" ").map(&:to_i).sort.reverse

score = Array.new(2,0)

cards.size.times do |i|
  score[i%2] += cards.first
  cards.shift
end

puts (score[0] - score[1]).abs