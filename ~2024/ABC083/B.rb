n,a,b = gets.chomp.split(" ").map(&:to_i)

puts [*1..n].select{|num| num.to_s.split("").map{|s| s.to_i}.inject(:+).between?(a,b)}.inject(:+)