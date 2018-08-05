class Array
  def lcm
    self.inject(:lcm)
  end
end

d,g = gets.chomp.split(" ").map(&:to_i)
set = []
d.times do |i|
  input = gets.chomp.split(" ").map(&:to_i)
  e = ((i+1)*100)*input[0] + input[1]
  set << {i:(i+1)*100, p_i:input[0], c_i:input[1], total:e, e:e/input[0]}
end

# 効率順
get_c = {cnt:0, val:0}
i = 0
set = set.sort_by{|s| s[:e]}.reverse
while get_c[:val] < g
  rest = (g-get_c[:val])%(set[i][:i])
  con = (g-get_c[:val])/(set[i][:i])
  if rest != 0
    con += 1
  end
  cnt = [con, set[i][:p_i]].min
  get_c[:cnt] += cnt
  get_c[:val] += (cnt == set[i][:p_i]) ? set[i][:total] : cnt * set[i][:i]
  i += 1
end

puts get_c[:cnt]
# 全部解いた場合の1問あたりの価値？

