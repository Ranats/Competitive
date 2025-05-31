n = gets.to_i
arr = []

mx = {index:0, value:0}
mx_2 = {index:0, value:0}

n.times do |i|
  input = gets.to_i
  if input > mx[:value]
    mx_2[:index] = mx[:index]
    mx_2[:value] = mx[:value]
    mx[:index] = i
    mx[:value] = input
  elsif input > mx_2[:value]
    mx_2[:index] = i
    mx_2[:value] = input
  end
  arr << input
end


n.times do |i|
  puts (i == mx[:index]) ? mx_2[:value] : mx[:value]
end