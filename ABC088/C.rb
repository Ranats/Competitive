cell = Array[9]

3.times do |i|
  cell[i*3],cell[i*3+1],cell[i*3+2] = gets.split(" ").map(&:to_i)
end

flg = true

if cell[0] - cell[3] != cell[1] - cell[4]
  flg = false
end

if cell[1] - cell[4] != cell[2] - cell[5]
  flg = false
end

if cell[3] - cell[6] != cell[4] - cell[7]
  flg = false
end

if cell[4] - cell[7] != cell[5] - cell[8]
  flg = false
end

if cell[0] - cell[6] != cell[1] - cell[7]
  flg = false
end

if cell[1] - cell[7] != cell[2] - cell[8]
  flg = false
end

puts flg ? "Yes" : "No"