s = gets.chomp

def check(s)
  return "WA" unless s[0] == 'A'
  s.slice!(0)
  return "WA" unless s[1..-2].count('C') == 1
  s = s[0] + s[1..-2].delete("C") + s[-1]

  s.split("").each do |c|
    if c != c.downcase
      return "WA"
    end
  end

  return "AC"
end

puts check(s)