a,b,k = gets.chomp.split(" ").map(&:to_i)

a_div = [1]
b_div = [1]

2.upto(a/2) do |i|
  if a % i == 0
    a_div << i
  end
end

2.upto(b/2) do |i|
  if b % i == 0
    b_div << i
  end
end

a_div << a
b_div << b

puts (a_div & b_div).reverse[k-1]