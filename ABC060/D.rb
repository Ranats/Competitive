if !ENV['RUBY_THREAD_VM_STACK_SIZE']
  exec({'RUBY_THREAD_VM_STACK_SIZE'=>'1000000000'}, '/usr/bin/ruby', $0)
end

N,W = gets.chomp.split(" ").map(&:to_i)
$product = []
N.times do
  $product << gets.chomp.split(" ").map(&:to_i)
end

$dp = Array.new(N+1){Array.new(W+1,0)}

def solve
  (N-1).downto(0) do |i|
    (W+1).times do |j|
      if j < $product[i][0]
        $dp[i][j] = $dp[i+1][j]
      else
        $dp[i][j] = [ $dp[i+1][j] , $dp[i+1][j - $product[i][0]] + $product[i][1]].max
      end
    end
  end

  puts $dp[0][W]
end

solve
