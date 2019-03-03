=begin
def check(s)
  s.each_with_index do |c,i|
    return s if i == s.size-1
#    puts "c:#{c} i:#{i}"
    if c != s[i+1]
      s.delete_at(i)
      s.delete_at(i)
      return s
    end
  end
end


s_org = gets.chomp.split("")

s = s_org.clone

while true
  tmp_s = s.clone
  ret_s = check(s)
#  puts "tmp_s : #{tmp_s}\nret_s : #{ret_s}"
  s.compact!
  break if tmp_s.size == ret_s.size || ret_s.size == 0
end

puts s_org.size - s.size
=end

# ぼく「隣り合う01消してったら，必ず最後はどっちかだけになるのでは？」
# ぼく「数が多い方が残るのでは」
# ぼく「💡」

s = gets.chomp.split("")

zero = s.count("0")
one = s.count("1")

puts [zero,one].min * 2