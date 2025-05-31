n = gets.to_i

hotels = gets.chomp.split(" ").map(&:to_i)

count = 0
hotels.each_with_index do |height,i|
  if hotels[0..i].all?{|h| h <= height }
    count += 1
  end
end

puts count