class Node
  attr_reader :value
  attr_accessor :next
  def initialize value
    @value = value
    @next = nil
  end
end

class SinglyLinkedList
  attr_reader :head, :tail
  def initialize head=nil
    @head = @tail = Node.new head unless head.nil?
  end

  def add node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next = Node.new(node)
    @tail = @tail.next
  end

  def shift node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next = @head
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
    prev_node = @head
    current_node = @head.next
    until current_node.nil?
      if current_node.value == value
        return prev_node.next = current_node.next
      end
      prev_node = current_node
      current_node = current_node.next
    end
  end
end
