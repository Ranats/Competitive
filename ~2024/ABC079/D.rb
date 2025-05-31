h,w= gets.chomp.split(" ").map(&:to_i)
$c = []
10.times do
  $c << gets.chomp.split(" ").map(&:to_i)
end
wall = []
h.times do
  wall << gets.chomp.split(" ").map(&:to_i)
end

$mp = []

def solve(cell,dp,sum_mp)
  ret = []
  magic_table = $c[cell]
#  magic_table[cell] = 100
  idx = nil
  mp = 0

  dp << cell

  puts "dp:#{dp}"
  magic_table.each_with_index do |mp,idx|
    puts "idx:#{idx} table:#{magic_table}"
#    puts "soto --- dp:#{dp} idx:#{idx} mp:#{mp}"
    unless dp.include?(idx)
#      puts "dp:#{dp} idx:#{idx} mp:#{mp}"
      sum_mp += mp
      if idx != 1
#        dp << idx
#        sum_mp += mp
        $mp << solve(idx,dp,sum_mp)
      else
        $mp << sum_mp
      end

    end

  end
  nil

=begin
  while dp.include?(idx) || idx == nil
    idx = magic_table.index{|mp| mp == magic_table.min}
    mp = magic_table[idx]
    magic_table[idx] = 100
  end

  sum_mp += mp
  if idx != 1
    dp << idx
    sum_mp = solve(idx,dp,sum_mp)
  end

  puts "sum:#{sum_mp} idx:#{idx} min:#{mp} cell:#{cell} "

  return sum_mp
=end
end

mp_table = Array.new(10,nil)

mp = 0
wall.each do |row|
  row.each do |cell|
    if cell != -1 && cell != 1
      puts "cell:#{cell} mp_table:#{mp_table}"
      dp = []
      if mp_table[cell] != nil
        mp += mp_table[cell]
      else
        ret = solve(cell,dp,0)
        p ret
        puts "$mp:#{$mp}"
        mp_table[cell] = ret
        mp += ret
      end
    end
  end
end

puts mp