class Node
  attr_reader :value
  attr_accessor :next, :prev_node
  def initialize value
    @value = value
  end
end

class DoublyLinkedList
  attr_reader :head, :tail
  def initialize head=nil
    @head = @tail = Node.new head unless head.nil?
  end

  def add node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next = Node.new(node)
    @tail.next.prev_node = @tail
    @tail = @tail.next
  end

  def shift node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next = @head
    @head.prev_node = node
    @head = node
  end

  def find value
    current_node = @head
    until current_node.nil?
      return current_node if current_node.value == value
      current_node = current_node.next
    end
  end

  def remove value
    @head = @head.next and return if @head.value == value
    node = self.find(value) || return
    next_node = node.next
    prev_node = node.prev_node
    next_node.prev_node = node.prev_node if next_node
    prev_node.next = node.next
  end

end
