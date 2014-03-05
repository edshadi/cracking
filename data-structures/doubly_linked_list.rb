class Node
  attr_reader :value
  attr_accessor :next_node, :prev_node
  def initialize value
    @value = value
    @next_node = next_node
  end
end

class DoublyLinkedList
  attr_reader :head, :tail, :current_node
  def initialize head=nil
    @current_node = @head = @tail = Node.new head unless head.nil?
  end

  def add node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next_node = Node.new(node)
    @tail.next_node.prev_node = @tail
    @tail = @tail.next_node
  end

  def shift node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next_node = @head
    @head.prev_node = node
    @head = node
    self.reset!
  end

  def next_node
    @current_node = @current_node.next_node
  end

  def prev_node
    @current_node = @current_node.prev_node
  end

  def find value
    self.reset!
    until @current_node.nil?
      return @current_node if @current_node.value == value
      self.next_node
    end
  end

  def remove value
    @head = @head.next_node and return if @head.value == value
    node = self.find(value) || return
    self.reset!
    next_node.prev_node = node.prev_node if next_node
    prev_node.next_node = node.next_node
  end

  def reset!
    @current_node = @head
  end
end
