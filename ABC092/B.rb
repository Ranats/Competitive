n = gets.to_i
d,x = gets.chomp.split(" ").map(&:to_i)

eaten_choco = n
n.times do
  input = gets.to_i
  i = 1
  while (input*i)+1 <= d
    eaten_choco += 1
    i+=1
  end
end

puts eaten_choco + x
