def check_r(s, arr)
  left = nil
  s.each_with_index do |c,i|
    if left.nil?
      left = c
      arr[i] = 0
      arr[i+1] += 1
      next
    end

    if c == 'L'
      arr[i-1] = arr[i] - 1
      arr[i] = 1
      return
    end

    arr[i+1] += arr[i]
    arr[i] = 0
  end
end

def check_l(s,arr)
  right = nil
  arr.reverse!
  s.reverse.each_with_index do |c,i|
    if right.nil?
      right = c
      arr[i] = 0
      arr[i+1] += 1
      next
    end

    if c == 'R'
      arr[i-1] = arr[i] - 1
      arr[i] = 1
      arr.reverse!
      return
    end

    arr[i+1] += arr[i]
    arr[i] = 0
  end
end

def check(s,arr)
  left = s[0]
  s.each_with_index do |c,i|
    if i == 0
      next
    end
    if arr[i] == 0
      next
    end

    # 偶数個だけまとめる？
    if left == 'R' && left == c
      s[i-1] = 0
      j = i
      while s[j+1] == c # 一個右s[j]も R
        arr[j] = 0
        if s[j+2] == c && s[j+3] == c
          arr[j+2] = 0
          arr[j+3] = 0
          j += 3
        else
          break
        end
      end
      arr[j] += j - i + 2
    end

    # L=>一個右と同じならまとめる？
    if c == 'L'
      if left == c
        j = i
        while s[j+1] == c
          arr[j] = 0
          if s[j+2] == c && s[j+3] == c
            arr[j+2] = 0
            arr[j+3] = 0
            j += 3
          else
            break
          end
        end
        arr[j-1] += j - i
      end
    end

    left = c
  end
end

def move(s,arr)
  new = [0] * s.size
  s.each_with_index do |c,i|
    if c == "R"
      new[i+1] += arr[i]
    end
    if c == "L"
      new[i-1] += arr[i]
    end
  end

  new
end

s = gets.chomp.split("")
arr = [1] * s.size


# 左端からRが連続する分だけ調べる
# 右端からLが連続する分だけ調べる
# RとLが交互になってる部分は収束する

#check_r(s,arr)
#p arr
#check_l(s,arr)
#p arr
#exit

## 動かしてって反復が見つかったら終了
# => O(n**n)
# RLRLLLLLLLL......L とか

check(s,arr)
p arr

old_2 = nil
old = nil
(10**100).times do |i|
  old_2 = old
  old = arr
  arr = move(s,arr)

  puts "##{i}"
  puts "old_2: #{old_2}"
  puts "old:   #{old}"
  puts "arr:   #{arr}"

  if arr == old_2
    if (i+1).even?
      puts arr.join(" ")
    else
      puts old.join(" ")
    end
    break
  end
end
