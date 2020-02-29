class GraphNode
    attr_accessor :value, :neighbors
    def initialize(val)
        @value = val
        @neighbors = []
    end

    def <<(node)
        @neighbors << node
    end

    def self.bfs(starting_node, target_value)
        que = [starting_node]
        checked = []
        until que.empty?
            checking = que.pop
            checked.include?(checking) ? next : checked << checking
            return checking if checking.value == target_value
            checking.neighbors.each do |neighbor|
                que.unshift(neighbor) if !checked.include?(neighbor)
            end
        end
        return nil
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

p GraphNode.bfs(a, "f")