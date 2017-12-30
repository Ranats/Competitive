n = gets.to_i
arr = gets.chomp.split(" ").map(&:to_i)

$count = [0,0]

flg = true

2.times do |j|
  tmp_arr = Marshal.load(Marshal.dump(arr))
  sum = tmp_arr[0] + tmp_arr[1]
  if sum == 0
    if flg
      tmp_arr[1] -= 1
    else
      tmp_arr[1] += 1
    end
    $count[j] += 1
  end

  if flg
    if sum > 0
      tmp_arr[1] -= sum+1
      $count[j] += sum+1
    end
  else
    if sum < 0
      tmp_arr[1] += sum+1
      $count[j] += sum+1
    end
  end

  sum = tmp_arr[0] + tmp_arr[1]

  (2...tmp_arr.size).each do |i|
    diff = sum + tmp_arr[i]
#  puts %(sum : #{sum})
#  puts %(diff : #{diff})
    if sum > 0
      if diff >= 0
        tmp_arr[i] -= diff.abs+1
        $count[j] += diff.abs+1
      end
    else
      if diff <= 0
        tmp_arr[i] += diff.abs+1
        $count[j] += diff.abs+1
      end
    end
    sum += tmp_arr[i]
#    p sum
#    p tmp_arr
  end

  flg = false
end

#p $count
#p arr
puts $count.min