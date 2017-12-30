$str = 'ABC'.split('')
$s = []
3.times do
  $s << gets.chomp.split('')
end

def flow(i)
  n = $s[i].shift
  if n.nil?
    puts $str[i]
    exit
  end
  flow($str.index(n.upcase))
end

flow(0)