n,k = gets.chomp.split(" ").map(&:to_i)
arr = gets.chomp.split(" ").map(&:to_i)

double = []
t = 2
while t < 10**18
  double << t
  t *= 2
end


dividable = []
array = []

arr.each_with_index do |x, i|
  div = [double.index{|d| d > x} + 1,k].min
  dividable << div
  array << Array.new(div){i}
end

p dividable
p double
p array

if n == 1
  puts dividable[0]
  exit
end

$k = k

def solve(div,i,sum)
  div[i].times do |d|
    (i+1).upto(div.size-1) do |j|
      c = div[j]
      if sum + div[j] > $k
        c = $k - sum
      end
      return c + solve(div,j,sum)
    end
  end
end

count = 1
puts solve(dividable,0,0)
exit

dividable[0].times do |d|
  1.upto(n-1) do |i|
    c = dividable[i]
    if d + dividable[i] > k
      c = k - d
    end
    count += c

    dividable[i].times do |d2|

    end

  end
end