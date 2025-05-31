class Edge
  attr_reader :s, :e, :z

  def initialize(s, e, z)
    @s = s
    @e = e
    @z = z
  end
end

class Graph
  def initialize(n,edges)
    @city = n
    @dist = Array.new(n).map{Array.new(n,Float::INFINITY)}
    edges.each do |edge|
      @dist[edge.s][edge.e] = @dist[edge.e][edge.s] = [@dist[edge.e][edge.s], edge.z].min
    end
  end

  def warshall_floyd
    @city.times do |k|
      @city.times do |i|
        @city.times do |j|
          @dist[i][j] = [@dist[i][j], @dist[i][k] + @dist[j][k]].min if(@dist[i][j] > @dist[i][k] + @dist[k][j])
        end
      end
    end
    @dist
  end
end


n, m, r = gets.chomp.split(" ").map(&:to_i)
input = gets.chomp.split(" ").map{|i| i.to_i.pred}
query = input.permutation(r)

edges = []

m.times do
  s, e, z = gets.chomp.split(" ").map(&:to_i)
  edges << Edge.new(s.pred, e.pred, z)
end

graph = Graph.new(n,edges)
dist = graph.warshall_floyd

score = []
query.each do |route|
  score << route.each_cons(2).map{|a,b| dist[a][b]}.inject(&:+)
end
p score.min