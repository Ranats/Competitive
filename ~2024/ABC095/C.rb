a,b,c,x,y = gets.chomp.split(" ").map(&:to_i)

a = {cost:a, require:x}
b = {cost:b, require:y}

min = [a,b].min_by{|hash| hash[:require]}
max = [a,b].max_by{|hash| hash[:require]}
other = max.clone
other[:require] -= min[:require]

cost_a = 2*c * min[:require]
cost_a += other[:cost] * other[:require]

cost_b = 2*c * max[:require]

cost_c = a[:cost] * a[:require] + b[:cost] * b[:require]

puts [cost_a,cost_b,cost_c].min
