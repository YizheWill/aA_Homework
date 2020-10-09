class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peep
    @stack.last
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end
end

class Map
  def initialize
    @map = []
  end

  def set(key, val)
    @map.each do |e|
      return e[1] = val if e.first == key
    end
    @map << [key, val]
    return val
  end

  def get(key)
    @map.each do |ele|
      return ele.last if ele.first == key
    end
    nil
  end

  def delete(key)
    @map.reject! { |e| e.first == key }
    return key
  end

  def show
    @map.deep_dup
  end

  private

  #this is neat code
  def deep_dup
    @map.map { |e| e.is_a?(Array) ? deep_dup(e) : ele }
  end
end
