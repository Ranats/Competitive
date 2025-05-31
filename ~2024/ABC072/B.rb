s = gets.chomp.split("").map.with_index{|x,i|
  if(i%2==0)
    x
  end
}.compact

puts s.join
