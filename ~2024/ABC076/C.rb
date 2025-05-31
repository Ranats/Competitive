s = gets.chomp.reverse
t = gets.chomp.reverse

pattern = ""
t.size.times do |i|
  pattern << "[\?#{t[i]}]"
end

match = []
t.size.times do
  match << s.sub!(/#{pattern}/,t)
end


puts (match.compact.empty?) ? "UNRESTORABLE" : s.gsub(/\?/,"a").reverse
