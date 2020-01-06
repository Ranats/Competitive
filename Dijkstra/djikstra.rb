require 'thread'

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
    connect.each do |cost|

    end
  end

  def id
    @id
  end

end
#  二分ヒープに格納するように実装
graph = []

file = open(ARGV[0])
while (line = file.gets)
  graph << line.chomp.split(" ").map(&:to_i)
end

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