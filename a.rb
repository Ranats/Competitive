arr = [*1..5]

[*1..20].map do |n|
  next printf "FizzBuzz " if (n%15 == 0)
  next printf "Buzz "     if (n% 5 == 0)
  next printf "Fizz "     if (n% 3 == 0)
  printf "#{n} "
end

name = "hoge"
p name.tap{name=nil}
p name