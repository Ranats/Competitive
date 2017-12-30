n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

ans = []
lookup = 0
(2*n).times do |i|
  (lookup).upto(arr.size-2) do |idx|
    if arr[idx] > arr[idx+1]
      # -2 -3
      # diff = -2+3 = 1
      diff = arr[idx] - arr[idx+1]
      found = arr.index{ |other| other < -1 * diff }

      # diff を満たすマイナス値が見つかる
      if found
#        puts "found"
        arr[idx] += arr[found]
        ans += ["#{found+1} #{idx+1}"]
        lookup = idx+1
        break
      end


      # -2 -3
      # diff = -2+3 = 1
      min_idx = arr.index{|a| a == arr.max}
      arr.each_with_index do |other,idx|
        if other < arr[min_idx] && other >= diff
          min_idx = idx
        end
      end

      arr[idx+1] += arr[min_idx]
      ans += ["#{min_idx+1} #{idx+2}"]
      lookup = idx + 1
      break
    end

    # 条件を満たす a[idx] < a[idx+1]
    lookup = idx + 1
  end
  if lookup >= arr.size
    break
  end
end

while arr[-2] > arr[-1]
  max = arr.index{|a| a == arr.max}
  arr[-1] += arr[max]
  ans += ["#{max+1} #{arr.size}"]
end

#p arr
puts ans.size
ans.each do |a|
  puts a
end