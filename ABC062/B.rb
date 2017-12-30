h,w = gets.chomp.split.map(&:to_i)
px = []
puts "#" * (w+2)

h.times do
  input = gets.chomp
  puts "##{input}#"
end
puts "#" * (w+2)
