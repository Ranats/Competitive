### https://beta.atcoder.jp/contests/soundhound2018-summer-qual/tasks/soundhound2018_summer_qual_c

def succ(arr, limit)
  idx = arr.size - 1
  loop do
    if idx < 0
      return nil
    end
    if arr[idx] == limit
      arr[idx] = 1
      idx -= 1
    else
      arr[idx] = arr[idx].next
      break
    end
  end
  return arr
end

n, m, d = gets.split(" ").map(&:to_i)

first = [1]*m
comb = [[1]*m]
beautiful = []


agent = first
loop do
    b_total = 0
    agc = agent.clone
    f_memo = []
    (agent.size-1).times do |i|
      f = [agent[i],agent[i+1]]
      if f.include?(0)
        next
      end
      [f,f.reverse].uniq.each do |f|
        if (f[0] - f[1]).abs == d
          b_total += agent.join.scan(f.join).size
        end
      end
      f_memo << f
      i += 1

      agent = agent.join(',').gsub(/#{f.join(',')}/,"nil,nil").split(",").map(&:to_i)
      p agent
      gets
    end

    puts "a: #{agc} b: #{b_total}"
    beautiful << b_total
    agent = succ(agc,n)
    #comb << succ(comb.last.clone, n)
    if agent.nil?
      break
    end

    next


    agent.each_cons(2).with_index do |x, i|
#      puts "x : #{x}"
#      p [x[0], x[1]].sort
      keys = memo.keys
      vals = memo.values
#      puts "memo : #{memo}"
#      puts "keys : #{keys}"
#      puts "vals : #{vals}"
      if keys.include?([x[0], x[1]].sort)
        b_total += vals[keys.index([x[0], x[1]].sort)]
      else

        if (x[0] - x[1]).abs == d
          b_total += 1
          unless keys.include?(agent[0..i+1])
            memo[agent[0..i+1]] = b_total
          end
        else
          memo[[x[0],x[1]].sort] = 0
        end
      end
    end

    beautiful << b_total

  # add
  agent = succ(agent,n)
  #comb << succ(comb.last.clone, n)
  if agent.nil?
    break
  end
end

puts format("%.10f",beautiful.inject(0.0000000000){|r,i| r+=i}/beautiful.size)
exit