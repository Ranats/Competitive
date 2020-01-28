###
# Written by Satoshi Coda. 2020.01
###

class Array
  def swap!(a,b)
    raise ArgumentError unless a.between?(0, self.count-1) && b.between?(0, self.count-1)

    self[a], self[b] = self[b], self[a]
    self
  end
end

class Integer
  N_BYTES = [42].pack('i').size
  N_BITS = N_BYTES * 16
  MAX = 2 ** (N_BITS - 2) - 1
  MIN = -MAX - 1
end

MAX_DISTANCE = Integer::MAX

# 辿ってきたルートを集積
def trace( node , start_node, route = [])
  route.unshift( node.id )
  return route if start_node == node
  trace( node.from, start_node, route)
end

class Node
  attr_accessor :done, :cost, :from, :heap, :id

  def initialize( id )
    @id = id
    @done = false
    @cost = MAX_DISTANCE    # スタート位置からこのノードまでの総コスト
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
    if size <= 0
      @heap.pop
      return
    end
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
def dijkstra( file=nil, start=0, goal=0 )
  graph = []
  num_of_cities = file.gets.to_i

  # ファイルからグラフを構成
  while (line = file.gets)
    graph << line.chomp.split(" ").map(&:to_i)
  end

  # ノードを初期化
  nodes = Array.new(num_of_cities){|i| Node.new(i) }

  # 隣接するノードを二分ヒープに追加
  graph.each_with_index do |path, i|
    nodes[i].set_cost( path )
  end

  # 探索開始
  visited = []        # 探索済みリスト
  now = nodes[start]  # 現在位置::Node
  now.cost = 0        # 初期地点への到達コストを 0 に設定

  # メインループ
  until nodes.all? {|node| node.heap.empty? }
#    puts "now: node #{now.id}"
#    puts "visited : #{visited.each {|node| node.id}}"
#    puts "distance : #{distance}"

    # 隣接ノードへの距離を更新
#    puts "---update adjacent distance"
    adjacent = now.heap                  # 隣接するノード ＝ ヒープを取得
    adjacent.each do |node_h|            # 隣接距離を更新
      node = nodes[node_h[:id]]          # 隣接ノード
      dist_temp = now.cost + node_h[:cost]  # 現在位置までのコスト＋移動先へのコスト が
      node.cost = [node.cost,dist_temp].min # 移動先のノードの既に設定済みのコストよりも小さければ 更新
    end

    # 最小ノードへ遷移
#    puts "---transition next node"
    # 探索済みリストに現在ノードを追加
    visited << now

    # 到達可能なノードをヒープから順に取り出し，未探索であれば続行．探索済みであれば再度ヒープから取り出す
    until now.heap.empty?
      min = nodes[now.pop[:id]]           # @heap => ::Hash
      break unless visited.include?(min)
#      puts " visited!"
    end

    # ヒープが空 ＝ どの隣接してるノードも探索済みだった場合，:from を辿り，手戻る
    if now.heap.empty?
#      puts " empty!"
      now = now.from
      next
    end

    # :from を設定し，現在ノードを移動
    min.from = now
    now = min
  end

  # 探索終了
  ret = []
  nodes.each do |node|
#    puts "@id=#{node.id}, @cost=#{node.cost}, @from=#{trace(node,nodes[start])}, @heap=#{node.heap}"
    ret << "To vertex #{node.id} : weight= #{node.cost} : path= #{trace(node,nodes[start]).join("->")}"
  end

  ret
end


# main
print "Input File name : "
input = gets.chomp #input = "data.dat"

print "Out put File name : "
output = gets.chomp #output = "out"

begin
  file = open(input) #file = open(ARGV[0])
rescue
  puts "\n Cannot open File : #{file}"
  exit
end

print "Start point : "
start = gets.to_i

ret = dijkstra(file, start)
#p ret

# 出力
File.open(output,"w") do |f|
  f.puts "start point : #{start}"
  ret.each do |line|
    f.puts line
  end
end

puts "process "