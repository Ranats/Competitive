def solve(arr)
  return 0 if arr.uniq.size == 1

  mode = arr.group_by{|e| e}.max_by{|_,v| v.size}.first
  return arr.count{|x| x != mode}
end

n = gets.to_i
v = gets.chomp.split(" ").map(&:to_i)
ve = v.select.with_index {|e,i| i%2==0}
vo = v.select.with_index {|e,i| i%2==1}

if v.uniq.size == 1
  puts n/2
  exit
end

ve_group = ve.group_by{|e| e}.sort_by{|_,v| v.size}
ve_mode = ve_group[-1].first

vo_group = vo.group_by{|e| e}.sort_by{|_,v| v.size}
vo_mode = vo_group[-1].first

if ve_mode == vo_mode
  if ve.uniq.size == 1
    count = vo.size - vo_group[-2][1].size + ve.size - ve_group[-1][1].size
  elsif vo.uniq.size == 1
    count = ve.size - ve_group[-2][1].size + vo.size - vo_group[-1][1].size
  else
    count = [vo.size - vo_group[-2][1].size + ve.size - ve_group[-1][1].size,
             ve.size - ve_group[-2][1].size + vo.size - vo_group[-1][1].size].min
  end
else
  count = ve.size - ve_group[-1][1].size + vo.size - vo_group[-1][1].size
end

puts count
