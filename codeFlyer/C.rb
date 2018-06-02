n,$d = gets.split(" ").map(&:to_i)
x = gets.split(" ").map(&:to_i)

#                left(i) | right(i)
# |Xi-Xj| <= D の数 [i<j, j<i] => left, right

def bs(x,key,min,max,tf)
  if max < min
    return (tf) ? [tf,max] : [tf,min]
  end

  idx = min + (max - min) / 2
  if (x[idx] - key).abs > $d
    bs(x, key, min, idx-1, false)
  else
    bs(x, key, idx+1, max, true)
  end
end

def bsl(x,key,min,max,tf)
  if max < min
    return (tf) ? [tf,min] : [tf,max]
  end

  idx = min + (max - min) / 2
  if (x[idx] - key).abs > $d
    bsl(x, key, idx+1, max, false)
  else
    bsl(x, key, min, idx-1, true)
  end
end

def ncr(n, r)
  return 1 if r == 0
  (n - r + 1..n).inject(:*) / (1..r).inject(:*)
end

right = []
left = []
x.each_with_index do |num,i|
  # right
  r = bs(x,num,i+1,n-1,nil)
  right <<
    case r[0]
      when true; r[1] - i
      when false; r[1]-1 -i
      else; 0
    end
  # left
  l = bsl(x,num,0,i-1,nil)
  left <<
    case l[0]
      when true; i - l[1]
      when false; i - (l[1]+1)
      else; 0
    end
end

# i<j<k , Xk - Xj <=d となるi,j,kの組み合わせ
# = right(l)_C_2 (l-> 0 to n)
sumA = 0
n.times do |i|
  sumA += ncr(right[i],2)
end

# i<j<k, Xj - Xi <=d , Xk - Xj <=d となるi,j,kの組み合わせ
# = left(l) * right(l) (l-> 0 to n)
sumB = left.zip(right).inject(0){|sum,lr| sum + (lr[0] * lr[1])}

ans = sumB - sumA
puts ans