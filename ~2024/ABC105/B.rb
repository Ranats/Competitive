$n = gets.to_i

# 4x + 7y = n
# bfs書こうと思ったらいつの間にかdfsになってた

def dfs(x,lr)
  return true if x+lr == $n
  return false if x+lr > $n

  if dfs(x+lr, 4)
    return "Yes"
  end
  if dfs(x+lr, 7)
    return "Yes"
  end

  return false
end

if dfs(0,4)
  puts "Yes"
elsif dfs(0,7)
  puts "Yes"
else
  puts "No"
end
