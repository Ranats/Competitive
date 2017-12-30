class Edge
  attr_reader :s, :e, :z

  def initialize(s, e, z)
    @s = s
    @e = e
    @z = z
  end
end

class Graph
  def initialize(n)
    @city = n
    @dist = Array.new(n).map{Array.new(n,Float::INFINITY)}
  end

  def dijkstra(start,goal,done,z)
#    puts "18:start : #{start}  goal : #{goal}  done : #{done}  z:#{z}"
    done = Marshal.load(Marshal.dump(done))

    done[start] = z
    if start == goal
      return done.reject{|d| d==0 || d==false}.min
    end
    @city.times do |i|
#      puts "i:#{i} done:#{done}"
      unless done[i]
        if @dist[start][i] != Float::INFINITY
#          puts "@dist[#{start}][#{i}] = #{@dist[start][i]}"
          $score << dijkstra(i,goal,done,@dist[start][i])
        end
      end
    end

    return false
  end

  def add_node(edge)

    done = Array.new(@city,false)
    start = edge.s
    goal = edge.e

    $score = []

#    puts "start:#{start} goal:#{goal}"

    dijkstra(start,goal,done,0)

#    p @dist
#    puts "edge : #{edge.z}"
#    puts "socre : #{$score}"
    min = $score.reject{|s| !s}.min
#    puts "min : #{min}"
    if min
      if edge.z != min
        puts "-1"
        exit
      end
      @dist[edge.s][edge.e] = @dist[edge.e][edge.s] = edge.z
    else
      @dist[edge.s][edge.e] = @dist[edge.e][edge.s] = [@dist[edge.e][edge.s], edge.z].min
    end

  end

end


n = gets.to_i

city = []
n.times do
  city << gets.chomp.split(" ").map(&:to_i)
end

graph = Graph.new(n)
n.times do |i|
  (1).upto(n-1) do |j|
    min = city[i].sort[j]
    node = Edge.new(i,city[i].index(min),min)
    graph.add_node(node)
  end
end
