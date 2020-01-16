require 'thread'

class Array
  def swap!(a,b)
    raise ArgumentError unless a.between?(0, self.count-1) && b.between?(0, self.count-1)

    self[a], self[b] = self[b], self[a]
    self
  end
end

# 辿ってきたルートを集積
def trace( node , start_node, route = [])
  route.unshift( node )
  return route if start_node == node
  trace( node.from, start_node, route)
end

class Node
  attr_accessor :done, :cost, :from, :heap, :id

  def initialize( id , connect)
    @id = id
    @done = false
    # スタート位置からこのノードまでの総コスト
    @cost = -1
    @from = nil
    @heap = []
    p connect
    connect.each do |cost|
      unless cost == 0
        push_heap( cost )
      end
    end
  end

  def push_heap( x )
    size = @heap.size
    @heap[size] = x   # データをヒープの最後に追加
    k = size
    while @heap[k] > @heap[k/2] && k>1  # 親と比較
      swap(@heap[k],@heap[k/2])         # 親と交換
      k /= 2
    end
  end

  def id
    @id
  end

end
#  二分ヒープに格納するように実装
#  始点ノードを指定．　始点ノードのヒープ中の最小のノードに遷移？
# S=∅ 空集合
# Sに含まれない頂点のうち，始点からの距離が最小であるノードv_kを選択 （＝始点は距離0なので，最初は始点ノードが選択される）

# v_kに隣接するノードかつ，Sに含まれないノードについて，始点からの距離 d_i を再計算する
#   → d_i は各頂点が隣接する各頂点までの距離．→ 初期条件として与えられている．
#   → 与えられているものよりも v_k を経由した距離の方が短い = 始点から v_k への d_i + v_k から隣接する注目する頂点への距離
#   → d_iを更新．=> from を v_k に付け替える？

graph = []

print "Input File name : "
input = gets.chomp
print "Out put File name :"
output = gets.chomp

begin
  file = open(input)
#file = open(ARGV[0])
rescue
  puts "\n Cannot open File : #{file}"
  exit
end

N = file.gets.to_i

while (line = file.gets)
  graph << line.chomp.split(" ").map(&:to_i)
end

p N
p graph

node_size = graph.size

# heap Q
# Q(v) => ノードvから到達できる他のノードへの重み？
heap = Array.new(node_size)
#heap = Queue.new

graph.each_with_index do |g,i|
  node = Node.new(i,g)
end

# 開始位置が変わるとノードの持つ情報はすべて初期化される
# 二分ヒープ → そのノードからのコスト？
def dijkstra( s, t, heap)
  # スタート位置s, ゴール位置t,
  visited = [] #=> routeになるのでは？
  cost = 0
  node = heap[s].min
  unless visited.include?(node)
    visited << node
  end
  # 探索済みでないならば，探索済みに追加
  # ノードの重みを
end

# output
# weight root
# 3 1->2->3->...

# in case where start point is "3"
# To vertex 0 : weight=4 : root=1->2->3->4->...
# To vertex 1 :
# ...
# To vertex 7 : weight=5 : root=