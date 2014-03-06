require_relative '../linked-list/singly_linked_list'
Entry = Struct.new(:key, :value)
class HashTable
  attr_reader :length, :map
  def initialize
    @map = []
    @length = @map.length
  end

  def []= key, value
    hashed_key = self.hash_func(key)
    entry = Entry.new(key, value)
    @length += 1
    @map[hashed_key] = SinglyLinkedList.new(entry) and return unless @map[hashed_key]
    @map[hashed_key].shift(entry)
  end

  def [] key
    if list = @map[self.hash_func(key)]
      current_node = list.head
      until current_node.nil?
        if current_node.value.key == key
          value = current_node.value.value
          return value
        else
          current_node = current_node.next
        end
      end
    end
  end

  def hash_func key
    key.length % 10
  end
end
