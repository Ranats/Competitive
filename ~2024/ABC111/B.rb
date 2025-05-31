n = gets.to_i
[111,222,333,444,555,666,777,888,999].each do |x|
  if x >= n
    puts x
    exit
  end
end