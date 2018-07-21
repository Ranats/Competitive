n, m = gets.chomp.split(" ").map(&:to_i)
task = []
m.times do
  input = gets.chomp.split(" ").map(&:to_i)
  task << input
end

count = 0

while task.size > 0
  min = task.min_by{|arr| arr[1]}[1]
  size = task.size
  task.delete_if{|arr| arr[0] < min}
  if size != task.size
    count += 1
  end
end

puts count
# if a_i < a_i+1 && b_i > b_i+1 →　上書き？

