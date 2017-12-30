$position = []

def untie(rope)

  if rope.size == 1
    return true
  end

  if rope.inject(&:+) < $l
    puts "Impossible"
    exit
#    return false
  end

  index = rope.index(rope.min)
  first = rope[0...index]
  if first.empty?
    first = rope[0..index]
    last = rope[index+1..rope.size-1]
    $position << $rope.index(rope.min) + 1
  else
    last = rope[index..rope.size-1]
    $position << $rope.index(rope.min)
  end

#  puts %"min:#{rope.min}"
#  p index

#  puts %"rope:#{rope}"
#  puts %"first:#{first}"
#  puts %"first_size:#{first.size}"
#  puts %"last:#{last}"
#  puts %"last_size:#{last.size}"

  [first,last].each do |piece|
    unless untie(piece)
      return false
    end
  end

  true
end

get=->{gets.split.map(&:to_i)}

$n,$l = get.call

$rope = get.call

if untie($rope)
  puts "Possible"
  puts $position
else
  puts "Impossible"
end
