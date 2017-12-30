n = gets.to_i
k = gets.to_i

ball = gets.split(" ").map(&:to_i)

puts ball.inject(0){|dist,x| dist += [(k - x)*2,x*2].min }
