$n = gets.to_i

piece = Array.new(1000){Array.new(1000,".")}

def spray(arr,x,y)
  arr[x][y] = "X"
  arr[x-1][y] = "*" if x > 0
  arr[x][y-1] = "*" if y > 0
  arr[x+1][y] = "*" if x < $n-1
  arr[x][y+1] = "*" if y < $n-1
  return arr
end

def solve(arr,i,j)
  if arr[i][j] == "*" || arr[i][j] == "X"
    if j < $n-1
      return solve(arr,i,j+1)
    elsif i < $n-1
      return solve(arr,i+1,0)
    else
      # 右下=探索終了
      if arr.flatten.count("X") <= 201800
        return arr
      else
        return false
      end
    end
  end

  ops = case i
          when 0;
            case j
              when 0; [[i,j],[i+1,j],[i,j+1]]
              when $n-1; [[i,j],[i,j-1],[i+1,j]]
              else [[i,j],[i,j-1],[i+1,j],[i,j+1]]
            end
          when $n-1;
            case j
              when 0; [[i,j],[i-1,j],[i,j+1]]
              when $n-1; [[i,j],[i-1,j],[i,j-1]]
              else [[i,j],[i-1,j],[i,j-1],[i,j+1]]
            end
          else
            case j
              when 0; [[i,j],[i-1,j],[i+1,j],[i,j+1]]
              when $n-1; [[i,j],[i-1,j],[i,j-1],[i+1,j]]
              else [[i,j],[i-1,j],[i,j-1],[i+1,j],[i,j+1]]
            end
        end

  ops.each do |op|
    ret = solve(spray(arr.clone,op[0],op[1]),i,j)
    if ret
      return ret
    end
  end

end

solve(piece,0,0).each do |line|
  puts line[0..$n].join("").gsub(/\./,"X").gsub(/\*/,".")
end
exit

piece.each_with_index do |line,i|
  line.each_with_index do |x,j|
    if i%4 == 0
      if (j-1)%3 == 0
        piece[i][j] = "X"
#        piece[i-1][j] = "*" if i > 0
#        piece[i+1][j] = "*" if i < n-1
#        piece[i][j-1] = "*" if j > 0
#        piece[i][j+1] = "*" if j < n-1
      end

    elsif i%2 == 0
      if j==0 || (j>0 && (j-1)%3 != 0)
        piece[i][j] = "X"
#        piece[i-1][j] = "*" if i > 0
#        piece[i+1][j] = "*" if i < n-1
#        piece[i][j-1] = "*" if j > 0
#        piece[i][j+1] = "*" if j < n-1
      end

    end

  end
end

piece.each_with_index do |line,i|
  puts line[0..n].join("")#.gsub(/\./,"X").gsub(/\*/,".")
end
