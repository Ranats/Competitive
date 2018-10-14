n,x = gets.chomp.split(" ").map(&:to_i)
a = []
b = []
max = 0
maxi = 0
n.times do |i|
  input = gets.chomp.split(" ").map(&:to_i)
  a << input[0]
  b << input[1]
  if max < input[1]
    max = input[1]
    maxi = i
  end
end

a[maxi] += x

sum = 0
a.each_with_index do |num,i|
  sum += num * b[i]
end

puts sum