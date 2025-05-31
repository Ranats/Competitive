s = gets.chomp
u = s.split("").uniq

# nCv = n*(n-1)/v

# 2つ選ぶ
choice = s.size * (s.size-1) / 2
# 同じ文字2つ選ぶ
dub = 0
u.each do |c|
  e = s.count(c)
  dub += e * (e-1) / 2
end

puts choice - dub + 1