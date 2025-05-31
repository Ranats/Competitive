# A*(A-star)アルゴリズム

class Node
  attr_reader :status, :x, :y, :c_cost, :h_cost, :parent, :state

  def initialize(x,y,state)
    @status = :None
    @x = x
    @y = y
    @c_cost = 0
    @h_cost = 0 # dx+dy
    @score = -1
    @state = state
    @parent = nil
  end

  def get_score
    @score
  end

  def set_score(goal_x,goal_y, step)
    @c_cost = step
    @h_cost = goal_x - @x + goal_y - @y
    @score = @c_cost + @h_cost
  end

  def set_parent(cell)
    @parent = cell
  end

  def open_cell(step)
    @status = :Open
    set_score($W,$H,step)
  end

  def close(cells,step)
    target = []
    target << cells[@y][@x-1] if @x > 0
    target << cells[@y][@x+1] if @x < $W
    target << cells[@y-1][@x] if @y > 0
    target << cells[@y+1][@x] if @y < $H

    target.each do |cell|
      if cell.status == :None && cell.state == "."
        cell.open_cell(step)
        cell.set_parent(self)
      end
    end

    @status = :Close
  end
end

# goal
h,w = gets.split(" ").map(&:to_i)
$H = h - 1
$W = w - 1

cell = Array.new(h){Array.new(w)}
h.times do |i|
  gets.chomp.split("").each_with_index  do |c,j|
    cell[i][j] = Node.new(j,i,c)
  end
end

step = 1
cell[0][0].open_cell(0)
cell[0][0].close(cell,step)

#ループ
while true
  step += 1

  # Openステータスの中に終了座標に到達しているものを検索
  break if cell[$H][$W].status == :Open

  # Openステータスの中で一番小さいスコアのものを選択(同値は考慮しない？)
  target = nil
  min_score = 100000000
  cell.flatten.each do |c|
    if c.status == :Open && c.get_score < min_score
      min_score = c.get_score
      target = c
    end
  end

  if target.nil?
    puts "-1"
    exit
  end

  target.close(cell,step)
end

#puts "finish"
stack = cell[$H][$W]
route = []
until stack.nil?
  route << {x: stack.x, y: stack.y}
  stack = stack.parent
end

#cell.flatten.each_with_index do |c,i|
#  print c.get_score
#  if (i+1)%w == 0
#    puts ""
#  end
#end

count = 0
cell.flatten.each do |cell|
  unless route.include?({x:cell.x,y:cell.y})
    if cell.state == "."
      count += 1
    end
  end
end

puts count