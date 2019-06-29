class Integer
  def combination(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*) / k.factorial
  end

  def permutation(k)
    return 1 if k.zero?

    (self - k + 1..self).inject(:*)
  end

  def factorial
    return 1 if self.zero?

    (1..self).inject(:*)
  end
end

def factorial(number)
  number = 0 if number.nil?
  (1..number).inject(1,:*)
end

def perm n,r
  ret = 1
  n.downto(r) do |i|
    ret *= i
  end
  ret
end

def check(arr)
  arr.each_cons(2) do |a,b|
    if a==b && a == "B"
      return nil
    end
  end
  true
end

n,k = gets.chomp.split(" ").map(&:to_i)

delim = (10**9) + 7

1.upto(k) do |i|
  arr = ["R"]*(n-k)
  arr += ["B" * (k/i)
  count = 0
  arr.permutation(n-k+i).to_a.uniq.each do |pe|
    if check(pe).nil?
      next
    end
    p pe
    count += 1
  end

  puts count % delim
  # (k/i) => 同じものの数
  # (k%i) => 異なるものの数
#  ret = (n-k+1).permutation(i)
#  if k%i == 0
#    ret /= i.factorial
#  end
#  puts ret % delim
#  p (["B"]*k).combination(i).to_a
#  p (n-k+1).permutation(i)
#  p perm(n-k+1,i) /
end
