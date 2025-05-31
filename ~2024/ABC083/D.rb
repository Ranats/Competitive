s = gets.chomp.split("").map(&:to_i)

def check(s)
  flg0 = false
  flg1 = false
  start0 = 0
  start1 = 0
  end0 = 0
  end1 = 0
  es = s.size-1
  e = 0
  s.each_with_index do |c,i|
    # ゼロが出てきてない
    unless flg0
      if c == 0
        flg0 = true
        start0 = i
      end

    end

    if flg0

      unless flg1
        if c == 0
          end0 = i
        end

        if c == 1
          flg1 = true
          start1 = i
        end
      end

      if flg1
        if c == 0

        end
      end

    end

    if c == 0 && flg == false
      flg = true
      start = i
    end

    if c == 1 && flg == true

      flg1 = true
#      es = i-1 if es == 0
      e = i
    end

    # 1出て0
    if flg1 == true && c == 0
      return start,e
    end

    if c == 0 && flg == true
      es = i
    end
  end
  # 00001111
  return start, es
end



p s
wide = 2
while true
  s2 = s.join("")
  puts "s2 :#{s2}"
  break if s2.gsub!(/010/,"100").nil?
  wide = 2
  s = s2.split("")
  puts "s :#{s}"
end

while true
  s2 = s.join("")
  puts "s2 :#{s2}"
  break if s2.gsub!(/010/,"100").nil?
  wide = 2
  s = s2.split("")
  puts "s :#{s}"
end


p s2
exit



wide = s.size - 1
until s.all? { |c| c==0 }
  section = check(s)
#  puts "section : #{section}"
  section[0].upto(section[1]) do |i|
    s[i] = (s[i] == 0) ? 1 : 0
  end
  wide = [(section[1] - section[0] +1),wide].min
#  p wide
#  p s
end

puts wide
# 010
# 100
# 111
# 000

# 100000000