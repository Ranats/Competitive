a,b = gets.split.map &:to_i

if a > 0
  # どっちも正
    puts "Positive"
else
  # a が負
  if a < 0
    # どっちも負
    if b < 0
      if (b-a) % 2 == 0
        puts "Negative"
      else
        puts "Positive"
      end
    else
      # 正と負
      puts "Zero"
    end
  else
    # zero
    puts "Zero"
  end
end