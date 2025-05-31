def dfs(n,pos,goal,op,s)
  puts "pos : #{pos} goal : #{goal}"
  puts "s : #{s} n : #{n} op:#{op}"
  if pos == goal && n == 0
    return s
  end

  if n == 0
    return false
  end

  case op
    when "L" then pos[0] -= 1
    when "R" then pos[0] += 1
    when "D" then pos[1] -= 1
    when "U" then pos[1] += 1
    else n += 1
  end

  if op != 0
    s << op
  end

  n -= 1

  "LRUD".split("").each do |op|
    ret = dfs(n,pos,goal,op,s)
    if ret
      return ret
    end
  end

  false
end

n = gets.to_i

double = ['A','C','G','T'].repeated_permutation(n)
double.each do |arr|
  p arr
end