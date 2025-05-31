s = gets.chomp

valid = ('a'..'z')

valid.each do |v|
  if s.count(v) > 1
    puts "no"
    exit
  end
end

puts "yes"