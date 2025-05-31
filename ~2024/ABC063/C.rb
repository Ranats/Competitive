$n = gets.chomp.to_i
$score = []
$n.times do
  $score << gets.chomp.to_i
end

$valid = []

$dp = {}

def f(n)
  ret = []
  n.times do |i|
    ret << $score[i]
  end
  return ret
end

$dp["0"] = [0]
def dfsc(i,j)
  if i >= $n
    return
  end
  $dp["#{i+1}"] ||= []
  $dp["#{i+1}"] << j #] ||= true
  $dp["#{i+1}"] << j+$score[i]#"] ||= true
  dfsc(i+1,j)
  dfsc(i+1,j+$score[i])
end


def dfs(n,c)
  puts "n:#{n} c:#{c}"
  p $dp
  if c == 1
    return $dp["#{n},#{c}"] ||= f(n)
  end

  $dp["#{n},#{c}"] ||= dfs(n,c-1) + [dfs(n-1,c-1)]  # $score[n-1] + dfs(n-1,c-1)
#  $dp["#{n},#{c}"] ||= dfs(n,c-1).collect{|arr| [arr].product(dfs(n-1,c-1))}#.select{|arr| arr.uniq.size == c}}
end

#dfs(n,n)

dfsc(0,0)

#p $dp

sum = 0
$dp.each do |k,v|
  val = v.reject{|s| s % 10 == 0}.max
  next if val.nil?
  sum = (sum > val) ? sum : val
end

puts sum

=begin
n.times do |i|
  valid << [*0..n].combination(i+1).to_a
  p i
end

p valid
sum = []
n.times do |i|
  sum << score.combination(i+1).to_a

#  score.combination(i+1).collect do |s|
#    if s.all?{|c| c%10==0}
#      next
#    end
#    sum << s.inject(&:+)
#  end

  p i
#  gets
end
p sum
ans = sum.flatten.max
puts (ans.nil?) ? "0" : ans

=end