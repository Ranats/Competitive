n = gets.chomp.split("")
out = ""
n.each do |c|
  out += (c=='1')?'9':'1'
end

puts out