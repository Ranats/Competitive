n,m = gets.split(" ").map(&:to_i)

x = (1/2.0) ** m
s = (x / (1-x)) / (1-x)
x_numer = (2**m)
s_numer = (2**m) - 1  #分子
s_denom = (2**m)      #分母

puts "x:#{x} s:#{s}"
ans = ((1900 * m) + (100 * (n-m)) ) * (2**m)

puts ans