def get
  gets.chomp.split(" ").map(&:to_i)
end

n,m = get
input = m.times.map{get.sort}.flatten!

task = Hash.new 0

input.each do |t|
  task[t] += 1
end

puts task.all?{|k,v| v.even?} ? :YES : :NO