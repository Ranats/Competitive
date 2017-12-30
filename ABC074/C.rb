a,b,c,d,e,f = gets.chomp.split(" ").map(&:to_i)

water = [100*a, 100*b]
suger = [c,d]

#concentration = (100 * suger) / (water + suger)

# 100g - e g溶ける

w = 0
s = 0

c1 = water[0] / c
c2 = water[1] / c

d1 = water[0] / d
d2 = water[1] / d

e1 = a * e
e2 = b * e

n = 1
w = water[0] * n

while c1 > e1
  c1 -= c
end
while w + c1 > f
  c1 -= c
end

puts "#{w + c1} #{c1}"