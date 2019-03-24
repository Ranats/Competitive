def check(arr)
  arr.each do |c|
    unless "ATGC".split('').include?(c)
      return false
    end
  end
  true
end

s = gets.chomp.split('')

atgc = [0]

1.upto(s.size) do |i|
  s.each_cons(i) do |arr|
    if check(arr)
      atgc << arr.size
    end
  end
end

puts atgc.max