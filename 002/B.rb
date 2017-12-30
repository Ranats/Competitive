get=->{gets.split.map(&:to_i)}
n,m = get.call

box = Array.new(n){{red:false,num:1}}

box[0][:red] = true

m.times do
  x,y = get.call
  x-=1
  y-=1
  if box[x][:num] > 0
    box[x][:num] -= 1
    box[y][:num] += 1
    if box[x][:red]
      if box[x][:num] == 0
        box[x][:red] = false
      end
      box[y][:red] = true
    end
  end
#  p box
end

puts box.count{|item| item[:red] == true}