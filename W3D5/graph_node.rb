require "set"
class GraphNode
  attr_accessor :value, :neighbors
  def initialize(value)
    @value = value
    @neighbors = []
  end

  def self.bfs(starting_node, target_value)
    return starting_node.value if starting_node.value == target_value
    graph = starting_node.neighbors
    set = Set.new([starting_node])
    until graph.empty?
      first = graph.shift
      p "looking for #{target_value}, current node is #{first}, this has been seen? #{set.include?(first)}"
      next if set.include?(first)
      return first if first.value == target_value
      graph += first.neighbors
    end
    nil
  end
end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')

a.neighbors = [b,c,e]
c.neighbors = [b,d]
e.neighbors = [a]
f.neighbors = [e]

p  GraphNode.bfs(a, "b")
p GraphNode.bfs(a, "f")
