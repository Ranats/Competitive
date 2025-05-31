n,d = gets.chomp.split(" ").map(&:to_i)

count = 0

tree = []
kansi = []
n.times do |i|
  tree << (i + 1).to_s
  count += 1

  if count > d * 2 + 1
    count = 1
  end

  if count <= d
    kansi << "L"
  else
    if count == d+1
      kansi << "o"
    else
      kansi << "R"
    end
  end

end

#p tree
#p kansi
cnt = kansi.count("o")
if kansi.last == "L"
  cnt += 1
end

puts cnt