def search(list)
  list.each_with_index do |to,step1|
# 1step
    to.each_with_index do |to,step2|
      # 2step
      if to == 1
        list[step2].each_with_index do |to,step3|
          if to == 1
            list[step3].each_with_index do |to,step4|
              if to == 1
                if [step1,step2,step3,step4].uniq.size == 4
                  # 3step  step1 -> step4
                  if list[step1][step4] != 1
                    $count += 1
                    list[step1][step4] = 1
                    list[step4][step1] = 1
                    return list
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  list
end

n,m = gets.chomp.split(" ").map(&:to_i)

list = Array.new(n).map{Array.new(n).map{0}}
m.times do
  input = gets.chomp.split.map(&:to_i)
  # 1step
  list[input[0]-1][input[1]-1] = 1
  list[input[1]-1][input[0]-1] = 1
end

$count = 0

n.times do
  list = search(list)
end

puts $count