a,b = gets.chomp.split(" ").map(&:to_i)

cards = [*a..b]

count = cards.size + 1

positive_dp = Marshal.load(Marshal.dump(cards))
negative_dp = []

(2).upto(cards.size) do |i|
  cards.combination(i).to_a.each do |arr|

    if negative_dp.include?(arr[0...arr.size-1])
      negative_dp << arr
      next
    end

#    puts "arr : #{arr}"
#    puts "arr-1 : #{arr[0...arr.size-1]}"

    if positive_dp.include?(arr[0...arr.size-1])
      flg = true
      arr[0...arr.size-1].each do |num|
#        puts "num : #{num}"
        unless num.gcd(arr[-1]) == 1
          flg = false
          break
        end
      end
      if flg
        count += 1
        positive_dp << arr
      else
        negative_dp << arr
      end

      next
    end

#    puts "arr : #{arr}"
    arr.each_with_index do |n, idx|
#      puts "idx :#{idx} arr.size:#{arr.size}"
      if idx == arr.size-1
        count += 1
        positive_dp << arr
        break
      end
#      puts "n :#{n}"
#      puts "arr[idx..arr.size] : #{arr[idx+1..arr.size]}"
#      puts n.gcd(arr[idx+1...arr.size][0])
#      puts arr[idx+1...arr.size].all?{|ar| n.gcd(ar) == 1}
      if arr[idx+1...arr.size].all?{|ar| n.gcd(ar) == 1}
        next
      else
        negative_dp << arr
        break
      end
    end

  end
end

#p positive_dp
puts positive_dp.size+1
#p count