s = gets.chomp.split("").uniq
diff = (('a'..'z').to_a - s) << "None"

puts diff.first