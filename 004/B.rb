$n,$x = gets.chomp.split(' ').map(&:to_i)
$arr = gets.chomp.split(' ').map(&:to_i)
$cost = Array.new($n,0)

$time = 0
$has = []
$target = [*0...$n]

mini = $arr.select{|ar| ar <= $x}

$target_i = 0

def search(idx)

  $arr.each_with_index do |arr,id|
    dist = $target_i - id
    if dist < 0
      dist = $n - id + $target_i
    end
    $cost[id] = arr + (dist * $x)
  end

  $time += ($cost.min)

end

$n.times do |i|
  $arr.each_with_index do |arr,id|
    dist = i - id
    if dist < 0
      dist = $n - id + i
    end
    $cost[id] = arr + (dist * $x)
  end

#  p $cost
  $time += ($cost.min)
#  p $time
end

p $time