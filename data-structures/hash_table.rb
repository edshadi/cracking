require_relative 'singly_linked_list'
class HashTable
  attr_reader :length, :map
  def initialize
    @map = []
    @length = @map.length
  end

  def []= key, value
    hashed_key = self.hash_func(key)
    @length += 1
    @map[hashed_key] = SinglyLinkedList.new([key, value]) and return unless @map[hashed_key]
    @map[hashed_key].shift([key, value])
  end

  def [] key
    if list = @map[self.hash_func(key)]
      current_node = list.current_node
      until list.current_node.nil?
        return list.current_node.value.last if list.current_node.value.first == key
        list.next_node
      end
    end
  end

  def hash_func key
    key.length % 10
  end
end
