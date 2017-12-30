n = gets.to_i
f = []#Array.new()
n.times do
  f << gets.split(" ").map(&:to_i)
end
p_i = []#Array.new()
n.times do
  p_i << gets.split(" ").map(&:to_i)
end


part = [0,1].repeated_permutation(10)
ans = []
part.each_with_index do |pa,idx|
  next if idx == 0 #|| idx == 512

  score = 0

  f.each_with_index do |fi,i|
    c = 0
    pa.each_with_index do |bit, j|
      if bit == 1 && fi[j] == 1
        c += 1
      end
    end
    score += p_i[i][c]
  end

#  puts "#{pa} : #{score}"
  ans << score
end

p ans.max