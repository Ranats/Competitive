$ret = []

def dfs(v)
#  puts %(v: #{v})
#  puts %(path: #{$path[v]})
  $ret << v
#  $used_v[v] = true
#  $ret.each do |idx|
#    $path[v][idx] = nil
#  end
  $path.map{|pth| pth[v] = nil} #edagari
  next_v = $path[v].find_index(true)
#  while $used_v[next_v]

#  end
  if next_v.nil?
    return
  end

  dfs(next_v)
end

N,M = gets.chomp.split(" ").map(&:to_i)
$path = Array.new(N){Array.new(N)}

$used_v = Array.new(N)

ans = []

#path_B
M.times do |idx|
  a,b = gets.chomp.split(" ").map(&:to_i)
  $path[a-1][b-1] = true
  $path[b-1][a-1] = true
end

#p $path

#$path.each_with_index do |pth,idx|
#  puts %(#{idx}: #{pth.map.with_index{|pt,idx| (pt) ? idx+1 : " "} } )
#end

#min_v_idx = path.find_index{|pth| pth.min_by{|pt| pt.count(true)}}

#p min_v_idx

min_v = $path.min_by{|pth| pth.count(true)}

#p min_v
#p $path.find_index(min_v)

# 次の頂点
start = $path.find_index(min_v)

dfs(start)

puts $ret.size
puts $ret.map{|idx| idx+=1}.join(" ")