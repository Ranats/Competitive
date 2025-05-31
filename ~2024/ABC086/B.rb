num = gets.gsub(" ","").chomp.to_i

square_num = [*1..10000].map!{|n| n*n}

puts square_num.include?(num) ? "Yes" : "No"