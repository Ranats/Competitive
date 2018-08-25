n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

def med(a)
  a.sort[(a.size/2)]
end

median = [med(arr)]
median += arr

2.upto(n-1) do |i|
  arr.each_cons(i){|arr| median << med(arr)}
end

puts med(median)