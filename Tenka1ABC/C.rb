def solve
  ret = 0
  div = 1.0
  loop do
    div += 1.0
    ret = $l_n / div
    break if (1.0 / ret).floor == (1.0 / ret)
  end
  $l_n -= ret
  ret
end

$l_n = gets.to_i

h,n,w = 1
$l_n = 4.0 / $l_n

h = solve
n = solve
w = $l_n

puts "#{(1.0/h).to_i} #{(1.0/n).to_i} #{(1.0/w).to_i}"
