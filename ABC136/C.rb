n = gets.to_i
h = gets.chomp.split(" ").map(&:to_i)

left = nil
h.each do |i|
  if left.nil?
    left = i
    next
  end
  if i > left
    i -= 1
  end
  if i < left
    puts "No"
    exit
  end
  left = i
end

puts "Yes"