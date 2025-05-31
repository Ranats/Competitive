class Fixnum
  def clamp(min,max)
    if self < min
      return min
    end
    if self > max
      return max
    end

    self
  end
end

a,b,n = gets.chomp.split(" ").map(&:to_i)
x = gets.chomp.split("")

#x = ("S"*10**5 + "C"*10**5 + "E"*10**5).split("")
#p x.size

x.each do |s|
  case s
    when "S" then a -= 1
    when "C" then b -= 1
    when "E" then
      if b > a
        b -= 1
      else
        a -= 1
      end
  end
end

puts a.clamp(0,10**5)
puts b.clamp(0,10**5)