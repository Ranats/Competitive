class Array
  def lcm
    self.inject(:lcm)
  end
end

class String
  def to_s2
    sum = 0
    d = self.size - 1
    self.split("").each_with_index do |c,i|
      sum += c.to_i * ((-2)**(d-i))
    end
    return sum
  end
end

class Integer
  def to_s2
    sum = 0
    d = self.to_s(2).size - 1
    self.to_s(2).split("").each_with_index do |c,i|
      sum += c.to_i * ((-2)**(d-i))
    end
    return sum
  end
end

n= gets.to_i

if n == 0
  puts "n"
  exit 0
end

# S = S_k S_(k-1) ... S_0 とすると，S_0 * (-2)^0 + S_1 * (-2)^1 + ... + S_k * (-2)^k = N
# 0  1 2  3  4   5  6    7
# 1,-2,4,-8,16,-32,64,-128
# 全部2の倍数 ➔ Nが奇数の場合，S_0 = 1

# -2^30 > 10^9

$n = n

arr = []
i = 0
s = 0
loop do
  s = (-2)**i
  break if s > n.abs
  i += 1
end

puts "11000101011001101110100010101"
p s

range = []
r = s.to_s(2)
puts "r : #{r}"
puts "s : #{s.to_s(2)}"

# 影響範囲
$min_s = ""
$max_s = ""
s.to_s(2).split("").reverse.each_with_index do |c,i|
  $min_s += (i % 2 == 0) ? c : "1"
  $max_s += (i % 2 == 0) ? "1" : c
end
$max_s.reverse!
$min_s.reverse!
#puts "x : #{max_s} , #{max_s.to_s2}"
#puts "n : #{min_s} , #{min_s.to_s2}"

def solve(s,bit)
  s[bit] = "1"

  puts "#{s}"
  puts "#{s.to_s2}"

  gets
  if sum == $n
    return s
  end

  if sum > $n + $max_s || sum < $n - $max_s
    puts $n
    puts sum
    s[bit] = "0"
  end
  s[bit+1] = "1"
  solve(s,bit+1)
end

s = s.to_s(2)
p s
solve(s,1)