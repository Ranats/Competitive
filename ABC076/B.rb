n,k = $<.map(&:to_i)
i = 1
n.times do
  i = [i*2,i+k].min
end
puts i
