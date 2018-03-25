a,b = gets.split(" ").map(&:to_i)

# 1,1
cell = [[".","#"]]

w = 2
h = 1

if a >= b
  if a <= 50
    cell = [[".","#"] * a]
  end

  cell << cell[0].clone
  cell << cell[0].clone

  if b <= 50
    (a-b).times do |i|
      cell[0][i*2] = "#"
      cell[2][i*2] = "#"
    end
  end

#  cell.each_with_index do |c,i|
#    p c.join("").split(".").reject(&:empty?).size
#    c.each_with_index do |c2,i2|
#      if c[i2-1] == "." && c2 == "#" && c[i2+1] == "."

#      end
#    end
#    p c
#  end
else

  if b <= 50
    cell = [["#","."] * b]
  end

  cell << cell[0].clone
  cell << cell[0].clone

  if a <= 50
    (b-a+1).times do |i|
      cell[0][i*2] = "."
      cell[2][i*2] = "."
    end
  end
end

puts "#{cell.size} #{cell[0].size}"

cell.each do |line|
  puts line.join("")
end
exit




while true

  if cell.flatten.count(".") < a

    if w < 99
       cell[0] << [".","#"]
        w += 2
    else

    end

  else
    count_black = cell.flatten.count("#")
    if cell.flatten.count("#") < b

    elsif cell.flatten.count("#") > b

    else
      break
    end

    if cell.flatten.count("#") == b
      break
    else

      if w < 100

        if cell[0][0] == "."
          cell[0].unshift("#")
          w += 1
        else

        end
        cell[0].each_with_index do |c,i|

        end

      end


    end


  end
end

cell.each do |line|
  puts line.join("")
end