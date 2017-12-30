a,b,c = gets.chomp.split(" ").map(&:to_i)
count = 0

#if a == b && a == c
#  puts "-1"
#  exit
#end

while true
  if a.odd? || b.odd? || c.odd?
    puts count
    exit
  end
  ta = b/2 + c/2
  tb = a/2 + c/2
  tc = a/2 + b/2
  a = ta
  b = tb
  c = tc
  count+=1

  if a == b && a == c
    puts -1
    exit
  end
end