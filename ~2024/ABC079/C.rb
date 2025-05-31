num = gets.chomp.split("").map &:to_i

def solve(a, b , c, num, op)
  ret = []
  if c > num.size
    if a == 7
      puts num.map(&:to_s).zip(op).flatten!.join("") + "=7"
      exit
    else
      return nil
    end
  end
#  puts "a:#{a} b:#{b} c:#{c} num:#{num}, op:#{op}"
  ret << solve(a+b,num[c],c+1,num,op+["+"])
  ret << solve(a-b,num[c],c+1,num,op+["-"])

end

solve(num[0],num[1],2,num, [])