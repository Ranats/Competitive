require 'prime'

n = gets.to_i
seq = gets.chomp.split(" ").map(&:to_i)

seq.delete_if{|a| a%2 != 0}.sort!

if seq.empty?
  puts 0
  exit
end

#p seq

count = 0
until seq.all?{|a| a%2 != 0}
  count += seq.size
  max = seq.select{|a| a % 2 == 0}.max

  size = max.prime_division.size

    seq.map! do |a|
      a * (3 ** (seq.size-1)) / 2
    end

#  seq.map! do |a|
#    if a == max
#      a /= 2
#    else
#      a *= 3
#    end
#  end
  
 p seq
  seq.delete_if{|a| a%2 != 0}
#  gets
end

p count
