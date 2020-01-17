#require 'thread'

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

  def initialize( id )
    @id = id
    @done = false
    # スタート位置からこのノードまでの総コスト
    @cost = -1
    @from = nil
    @heap = []
  end

  def set_cost( connect )

    connect.each_with_index do |cost, i|
      unless cost == 0
        push_heap( cost, i )
      end
    end
  end

  def pop
    ret = @heap[0]
    delete_maximum
    ret
  end

  def push_heap( x , i)
    size = @heap.size
    @heap[size] = {cost:x, id:i}   # データをヒープの最後に追加
    k = size
    while @heap[k][:cost] < @heap[k/2][:cost] && k>0  # 親と比較
      @heap.swap!(k,k/2)         # 親と交換
      k /= 2
    end
  end

  # ヒープの先頭を削除
  def delete_maximum
    size = @heap.size - 1
    @heap[0] = @heap.pop
    k = 1
    while 2*k <= size # 子を持つかどうかを判定
      if 2*k == size  # 子が1つの場合
        if @heap[k-1][:cost] > @heap[2*k-1][:cost]    # 親子の値を比較
          @heap.swap!(k-1,2*k-1)        # 親の値が大きい場合は値を交換
          k = 2*k-1
          next
        end
        return
      else
        # 子が2つの場合
        if @heap[2*k-1][:cost] < @heap[2*k][:cost]  # 葉から小さい方のデータを見つける
          small = 2*k-1
        else
          small = 2*k
        end

        if @heap[k-1][:cost] > @heap[small][:cost]
          @heap.swap!(k-1,small)
          k = small
          next
        end
        return
      end
    end
  end

  def id
    @id
  end

end

# 開始位置が変わるとノードの持つ情報はすべて初期化される
# 二分ヒープ → そのノードからのコスト？
def dijkstra( s, t)
  graph = []

  print "Input File name : "
#  input = gets.chomp
  print "Out put File name :"
#  output = gets.chomp

  input = "data.dat"
  begin
    file = open(input)
#file = open(ARGV[0])
  rescue
    puts "\n Cannot open File : #{file}"
    exit
  end

  cities = file.gets.to_i

  while (line = file.gets)
    graph << line.chomp.split(" ").map(&:to_i)
  end

  nodes = Array.new(cities){|i| Node.new(i) }

  graph.each_with_index do |path, i|
    p path
    nodes[i].set_cost( path )
  end

  nodes.each do |node|
    p node
  end

  visited = []
  visited << nodes[s]

  dist_sum = 0                      # start から 現時点 までの累計距離
  distance = Array.new(cities){0}   # start から 各頂点 までの距離

  # 最初のノードから他の到達可能なノードへのヒープを初期化 （初期ノードのヒープから到達可能なノードへの距離を格納）
  nodes[s].heap.each do |hash|
    distance[hash[:id]] += hash[:cost]
  end

  # 初期ノードの到達可能なヒープから最小のノード（根）を抽出
  min = nodes[s].pop
  p min


  # メインループ
  # 未探索の頂点が無くなるまで => Q-V > 0

  # if visited.include?(nodes[min[:id]])
  visited << nodes[min[:id]]


  nodes[0].delete_maximum




  exit
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

#  二分ヒープに格納するように実装
#  始点ノードを指定．　始点ノードのヒープ中の最小のノードに遷移？
# S=∅ 空集合
# Sに含まれない頂点のうち，始点からの距離が最小であるノードv_kを選択 （＝始点は距離0なので，最初は始点ノードが選択される）

# v_kに隣接するノードかつ，Sに含まれないノードについて，始点からの距離 d_i を再計算する
#   → d_i は各頂点が隣接する各頂点までの距離．→ 初期条件として与えられている．
#   → 与えられているものよりも v_k を経由した距離の方が短い = 始点から v_k への d_i + v_k から隣接する注目する頂点への距離
#   → d_iを更新．=> from を v_k に付け替える？

# 未確定リスト Q に二分ヒープを採用？


dijkstra(0,5)


# output
# weight root
# 3 1->2->3->...

# in case where start point is "3"
# To vertex 0 : weight=4 : root=1->2->3->4->...
# To vertex 1 :
# ...
# To vertex 7 : weight=5 : root=