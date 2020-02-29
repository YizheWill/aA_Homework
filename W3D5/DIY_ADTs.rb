class Stack
    def initialize(stack = [])
        @stack = stack
    end

    def inspect
        "<Stack #{self.object_id}>"
    end

    def push(el)
        stack.push(el)
        self
    end

    def pop
        stack.pop
    end

    def peek
        self.empty? ? (return "empty stack") : stack[-1]
    end

    def empty?
        stack.empty?
    end

    def show
        stack.map {|e| e} #protection : prevent 
    end

    private
    attr_reader :stack
end

class Queue
    def initialize(queue = [])
        @queue = queue
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end

    def show
        self
    end
end

class Map
    def initialize(map = [])
        @map = map
    end

    def set(key, value)
        flag = false
        @map.each do |sub|
            if sub[0] == key
                sub[1] = value
                flag = true
                return @map
            end 
        end
        if flag == false
            @map << [key, value]
        end
    end

    def get(key)
        @map.each do |sub|
            if sub[0] == key
                return sub[1]
            end
        end
        return nil
    end

    def delete(key)
        @map.select {|sub| sub[0] != key}
    end
end

class Node
    def initialize(val, parent, *children)
        @val = val
        @parent = parent
        @children = children
    end

    def root?
        @parent == nil
    end

    def leave?
        @children == nil
    end
end
