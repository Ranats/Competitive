class Edge
  attr_accessor :s, :e, :c, :z
#  attr_writer :c
  def initialize(s,e,z)
    @s = s
    @e = e
    @c = 0
    @z = z
  end
end

class Graph
  def initialize(graph)    #hはHash
#    @vs = vs    #Array:頂点（要素は Vertex）
    @es = {}    #Hash:枝（Vertex=>Array）:Arrayの要素はEdge
    graph.each do |hash|
      unless @es.has_key?(hash[:s])
        @es[hash[:s]] = []
      end
      @es[hash[:s]] << Edge.new(hash[:s],hash[:e],hash[:z])
    end
  end

  def get_edges(v)
    @es[v]    #頂点vからのすべての枝（Array）を返す
  end

  #goalを見つければtrue, 見つけられなければfalseを返す
  def find(start, goal)
    dfs(start, goal, [], 0, 0)
  end

  def dfs(v, goal, visited, score, point)
    score += point
    vis = Marshal.load(Marshal.dump(visited))

    if v == goal
      return score
    end

    if visited.include?(v)
      return "loop"
    end
    vis << v
    get_edges(v).each {|edge|
      ret = dfs(edge.e,goal,vis,score,edge.z)
      if ret != "loop"
        $score << ret
      else
        $score << false
      end
    }
    false
  end
end

n = gets.chomp.to_i
graph = []
(n-1).times do
  input = gets.chomp.split.map(&:to_i)
  graph << {:s => input[0], :e => input[1], :z => input[2]}
  graph << {:s => input[1], :e => input[0], :z => input[2]}
end

q,k = gets.chomp.split(" ").map(&:to_i)
query = []
q.times do
  input = gets.chomp.split.map(&:to_i)
  query << {:s => input[0], :e => input[1]}
end


g = Graph.new(graph)
query.each do |task|
  $score = []
  g.find(task[:s],k)
    $score.delete(false)
    ans = $score.min
  $score = []
  g.find(k,task[:e])
    $score.delete(false)
    ans += $score.min
  puts ans
end
