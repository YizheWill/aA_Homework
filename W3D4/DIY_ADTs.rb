class Stack
    def initialize(stack = [])
        @stack = stack
    end

    def push(el)
        @stack.push(el)
    end

    def pop
        @stack.pop
    end

    def peek
        @stack[-1]
    end
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