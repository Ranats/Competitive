class Array
  def lcm
    self.inject(:lcm)
  end
end

n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

lcm = arr.lcm - 1

p arr.inject{|f,num| f + lcm%num} - 1

#f = 0
#arr.each do |num|
#  f += lcm % num
#end

#puts f