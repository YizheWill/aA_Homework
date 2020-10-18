class LRUCache
  attr_reader :store, :size

  def initialize(size)
    @store = []
    @size = size
  end

  def count
    store.length
  end

  def add(el)
    i = store.index(el)
    i ? (store.delete_at(i)) : (store.pop if store.size >= size)
    store.unshift(el)
  end

  def show
    store
  end

  # private

  # # helper methods go here!

end
