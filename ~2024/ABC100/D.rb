n,m = gets.chomp.split(" ").map(&:to_i)

xyz = []

n.times do
  xyz << gets.chomp.split(" ").map(&:to_i)
end

x_sorted = xyz.sort_by{|cake| cake[0]}
y_sorted = xyz.sort_by{|cake| cake[1]}
z_sorted = xyz.sort_by{|cake| cake[2]}

xyz.each do |f|


end