$n,$m,$k = gets.chomp.split(" ").map(&:to_i)

cell = Array.new($n).map{Array.new($m,0)}

$trial = 0

$bag = []
$bag << cell

def count(cell)
  black = 0
  cell.each do |c|
    black += c.count(1)
  end
  return black
end

def bfs(cell,button)
  cell = Marshal.load(Marshal.dump(cell))
  if button < $m
    cell.each do |c|
      c[button] = (c[button] == 0) ? 1 : 0
    end
  else
    cell[button - $m].map! do |c|
      c = (c == 0) ? 1 : 0
    end
  end

  # 遷移後
  if $bag.include?(cell)
    return nil
  end
  $bag << cell

  if count(cell) == $k
    puts "Yes"
    exit
  end

#  $trial += 1
#  if $trial > 1000
#    puts "No"
#    exit
#  end

#  ($n+$m).times do |i|
#    unless i == button
#      bfs(cell,i)
#    end
#  end

  return cell

end

n = $n
m = $m
cells = []
(n+m).times do |i|
    cells << bfs(cell,i)
end

#cells.each do |cell|
#  puts "---"
#  cell.each do |c|
#    puts c.join
#  end
#end

def solve(o)
  cells = []
  o.reject { |arr| arr.nil? }.each do |cell|
    ($n+$m).times do |i|
      cells << bfs(cell,i)
    end
  end
  return cells.reject{|arr| arr.nil?}
end

($n+$m).times do
  cells = solve(cells)
  if cells.all?{|cell| cell.nil?}
    puts "No"
    exit
  end
end

puts "No"