s = gets.chomp.split("")
x,y = gets.split(" ").map(&:to_i)

op = []
s.each do |method|
  if op.empty?
    op << [method,1]
  else
    if op.last[0] == method
      op.last[1] += 1
    else
      op << [method,1]
    end
  end
end

arr = [{c:[0,0],lr:1,ud:0}]

op.each do |method|
#  puts "m: #{method}"
  if method[0] == "F"
    arr.each do |a|
#      p a
      a[:c][0] += a[:lr] * method[1]
      a[:c][1] += a[:ud] * method[1]
#      p a
    end
  else
    arr2 = []
    if method[1].even?
      arr.each do |a|
        lr = a[:lr]
        ud = a[:ud]
        c = a[:c]
#        arr2 << a.clone#{c:c,lr:lr,ud:ud}
        if lr != 0
          lr *= -1
        end
        if ud != 0
          ud *= -1
        end
        arr2 << {c:c.clone,lr:lr,ud:ud}
      end
    else
      arr.each do |a|
        lr = a[:lr]
        ud = a[:ud]
        c = a[:c]
        if lr == 0
          a[:lr] = 1
          a[:ud] = 0
          #arr2 << {c:c.clone,lr:1,ud:0}
          arr2 << {c:c.clone,lr:-1,ud:0}
        end
        if ud == 0
          a[:lr] = 0
          a[:ud] = 1
#          arr2 << {c:c.clone,lr:0,ud:1}
          arr2 << {c:c.clone,lr:0,ud:-1}
        end
      end
    end
    arr += arr2
  end
end

if arr.any?{|a| a[:c] == [x,y]}
  puts "Yes"
  exit
end
puts "No"

exit