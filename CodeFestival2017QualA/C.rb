h, w = gets.chomp.split(" ").map(&:to_i)

hash = Hash.new(0)

h.times do
  input = gets.chomp.split("")
  input.each do |c|
    hash[c] += 1
  end
end

hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }

remain_h = h

if h == 1
  if w == 1
    puts "Yes"
    exit
  else
    (w/2).times do |i|
      hash[0][1] -= 2
      if hash[0][1] < 0
        puts "No"
        exit
      elsif hash[0][1] == 0
        hash = hash[1..hash.size-1]
      else
        hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }
      end
    end
    if w%2 == 1
      if hash[0][1] >= 1
        puts "Yes"
        exit
      else
        puts "No"
        exit
      end
    end
    puts "Yes"
    exit
  end
elsif w == 1
  if h == 1
    puts "Yes"
    exit
  else
    (h/2).times do |i|
      hash[0][1] -= 2
      if hash[0][1] < 0
        puts "No"
        exit
      elsif hash[0][1] == 0
        hash = hash[1..hash.size-1]
      else
        hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }
      end
    end
    if h%2 == 1
      if hash[0][1] >= 1
        puts "Yes"
        exit
      else
        puts "No"
        exit
      end
    end
    puts "Yes"
    exit
  end
else
  (h-1).times do |j|
    (w/2).times do |i|
      hash[0][1] -= 4
      if hash[0][1] < 0
        puts "No"
        exit
      elsif hash[0][1] == 0
        hash = hash[1..hash.size-1]
      else
        hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }
      end
    end
    if w%2 == 1
      hash[0][1] -= 2
      if hash[0][1] < 0
        puts "No"
        exit
      elsif hash[0][1] == 0
        hash = hash[1..hash.size-1]
      else
        hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }
      end
    end

    remain_h -= 2

    if remain_h == 1
      (w/2).times do |i|
        hash[0][1] -= 2
        if hash[0][1] < 0
          puts "No"
          exit
        elsif hash[0][1] == 0
          hash = hash[1..hash.size-1]
        else
          hash = hash.sort { |(k1, v1), (k2, v2)| v2 <=> v1 }
        end
      end

      puts "Yes"
      exit
    elsif remain_h == 0

      puts "Yes"
      exit
    end

  end
end

puts "Yes"