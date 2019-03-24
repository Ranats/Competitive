n,q = gets.chomp.split(' ').map(&:to_i)
s = gets.chomp.split('')

sum = [0]

s.each_cons(2) do |arr|
  sum << sum.last
  sum[-1] += 1 if arr.join == "AC"
end

q.times do
  l,r = gets.chomp.split(' ').map(&:to_i)
  puts sum[r-1] - sum[l-1]
end
