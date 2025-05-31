a,b,k = gets.chomp.split(" ").map(&:to_i)

forward = [*a...[a+k,b].min]
backward = [*[b-k+1,a].max..b]

puts (forward + backward).uniq