N = gets.chomp.to_i
arr = gets.chomp.split(" ").map(&:to_i)
newArr = []

# 増加 or 減少
isUp = false
isDown = false

count = 1

(arr.size-1).times do |id|
  chk = arr[id+1] - arr[id]
#  puts %(id : #{id} #{arr[id]} , #{arr[id+1]})

  if isUp
    if chk >= 0 #|| chk == 0
      newArr << arr[id]
    else
      isUp = false
      count += 1
      newArr << arr[id]
      newArr << "|"
      next
    end
  end

  if isDown
    if chk <= 0 # || chk == 0
      newArr << arr[id]
    else
      isDown = false
      count += 1
      newArr << arr[id]
      newArr << "|"
      next
    end
  end

  if isDown == false && isUp == false
    newArr << arr[id]
    case
      when chk > 0
        isUp = true
        isDown = false
      when chk < 0
        isDown = true
        isUp = false
      when chk == 0
      else
        isUp = false
        isDown = false
        count += 1
        newArr << "|"
    end
  end

#  puts %(chk:#{chk})
#  puts %(isUp:#{isUp}, isDown:#{isDown})
#  puts count

end

#p newArr
puts count