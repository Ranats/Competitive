n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

# ｲﾝﾃﾞｯｸｽ範囲で差分ﾒﾓとってｵｷﾞｬ

def dfs(arr,i,cost,sum)
  cost += arr[i]
  arr[i] = nil
  (i-1).downto(0) do |side|
    break if arr[side].nil?
    cost += arr[side]
  end
  (i+1).upto(arr.size) do |side|
    break if arr[side].nil?
    cost += arr[side]
  end


  if arr.all?{|num| num.nil?}
    return cost
  end

  arr.each_with_index do |num,idx|
    next if num.nil?
    sum += dfs(arr.clone,idx,cost,sum)
  end

  return sum

end

sum = 0
arr.each_with_index do |num,idx|
  puts "arr1 : #{arr} idx :#{idx}"
  sum += dfs(arr.clone,idx,0,0)
  puts "sum : #{sum}"
end

puts sum % (10**9 + 7)