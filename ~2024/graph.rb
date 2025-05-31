# ワーシャルフロイド
# int dist[N][N]
# dist[...][...] = MAX
# for(A,,E) dist[A][B] = dist[B][A]
# for(int k=0; k<n; k++)  <- 中継点
#   for(int i=0; i<n; i++)
#     for(int j=0; j<n; j++)
#       dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])

# 0 -> 1
# 0 -> 2 -> 8 -> 4 -> 1 が最短のとき，
# 0 -> 4  の最短経路は
# 0 -> 2 -> 8 -> 4      と求まる．

# 2が中継点
# 0 -> [2] / -> 8 -> 4 -> 1   0->2 の距離が定まる．　841は未知なのでMAX
# 4が中継点
# 8 -> [4] / -> 1             8->4 の距離が定まる． 4->1 も定まる．

# 中継点を一番外側で回す

# next_permutation
# 辞書順で次の順列を返す関数

# 1. DFS
# 2. bitDP
#   dp[今まで行った場所][最後に行った場所]
#       2^R                 R

# たどる順番　→　一回辿った最短距離をメモ化

class Edge
  attr_accessor :s, :e, :c, :z

  def initialize(s, e, z)
    @s = s
    @e = e
    @z = z
  end
end

class Graph
  def initialize(graph)
    @es = {}
    graph.each do |hash|
      unless @es.has_key?(hash[:s])
        @es[hash[:s]] = []
      end
      @es[hash[:s]] << Edge.new(hash[:s], hash[:e], hash[:z])
    end
  end

  def get_edges(v)
    @es[v]
  end

  def find(start, goal)
    dfs(start, goal, [], 0, 0)
  end

  def dfs(v, goal, visited, score, point)
    score += point
    if score > $score
      return false
    end
    if score > $candidate
      return false
    end
    vis = Marshal.load(Marshal.dump(visited))

    if v == goal
      return score
    end

    if visited.include?(v)
      return false
    end
    vis << v
    get_edges(v).each { |edge|
      ret = dfs(edge.e, goal, vis, score, edge.z)

      if ret
        $score = ret
      end
    }
    false
  end
end

def warshall_floyd(n, graph)
  dist = Array.new(n){Array.new(n, Float::INFINITY)}
  graph.each do |edge|
    dist[edge.s][edge.e] = edge.z
  end
  n.times do |k|
    n.times do |i|
      n.times do |j|
        dist[i][j] = [dist[i][j], dist[i][k] + dist[j][k]].min
      end
    end
  end

  dist
end

n, m, r = gets.chomp.split(" ").map(&:to_i)
input = gets.chomp.split(" ").map{|i| i.to_i.pred}
query = input.permutation(r).to_a

graph = []

m.times do
  input = gets.chomp.split(" ").map(&:to_i)
  graph << Edge.new(input[0].pred, input[1].pred, input[2])
  graph << Edge.new(input[1].pred, input[0].pred, input[2])
end

dist = warshall_floyd(n,graph)

score = []
query.each do |route|
  score << route.each_cons(2).map{|a,b| dist[a][b]}.inject(&:+)
end

puts score.min
exit