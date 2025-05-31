n,m = gets.chomp.split(" ").map(&:to_i)
inu = []
saru = []
n.times do
  inu << {inu:true,saru:false}
end
m.times do
  saru << {inu:false,saru:true}
end

sets = (inu+saru).permutation(n+m)

#p sets
count = 0
flag = false
sets.each do |set|
#  puts %(set:#{set})
  set.each_cons(2) do |a,b|
#  puts %(a:#{a} b:#{b})
  if (a[:inu] && b[:inu]) || (a[:saru] && b[:saru])
    flag = false
    break
  end
  flag = true
  end
  if flag
    count += 1
  end
  flag = false
end

puts count