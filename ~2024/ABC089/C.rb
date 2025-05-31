n = gets.to_i

pool = Hash.new(0)
n.times do
  pool[gets.chomp[0]]+=1
end

count = "MARCH".split("").combination(3).map do |a,b,c|
  pool[a] * pool[b] * pool[c]
end.inject(:+)

puts count