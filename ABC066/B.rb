s = gets.chomp
n = s.length

1.upto(n) do |i|
  guu = s[0...(n-i)]
  c = guu.length/2
  if guu[0...c] == guu[c..-1]
    puts guu.length
    exit
  end
end