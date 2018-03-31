def solve(s)
  if s == "zyxwvutsrqponmlkjihgfedcba"
    return  "-1"
  end

  dict = ("a".."z").to_a #.reverse

  if s.size > 25
    i = -2

    while true
      s2 = s[0...i]
      dict_tmp = dict - s2.split("")

      dict_tmp.each do |let|
        op = s2 + let
        if op > s
          return op
        end
      end

      i -= 1
    end
  end

  dict -= s.split("")
  return s + dict[0]
end

s = gets.chomp #.split("")

puts solve(s)