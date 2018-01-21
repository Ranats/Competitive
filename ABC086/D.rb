n,k = gets.chomp.split(" ").map(&:to_i)
tasks = []
n.times do
  input = gets.chomp.split(" ")
  tasks << {x:input[0].to_i, y:input[1].to_i, wb:input[2]}
end

p tasks

# min: x - (k-1) , y - (k-1) ... x,y
# max:

# n ... n+k-1

x_min = tasks.min_by{|task| task[:x]}[:x]
y_min = tasks.min_by{|task| task[:y]}[:y]

x_max = tasks.max_by{|task| task[:x]}[:x]
y_max = tasks.max_by{|task| task[:y]}[:y]


black = [x_min,y_min]

count = 0
while true
  tasks.each do |task|
    xy = [task[:x],task[:y]]

    bx = black[0]
    while bx <= task[:x]
      bx += k*2
    end

    if bx == taks[:x] || bx+k-1 >= task[:x]

    end


    if task[:x] >= black[0]

    end

  end
end
