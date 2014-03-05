class Node
  attr_reader :value
  attr_accessor :next_node
  def initialize value
    @value = value
    @next_node = next_node
  end
end

class SinglyLinkedList
  attr_reader :head, :tail, :current_node
  def initialize head=nil
    @current_node = @head = @tail = Node.new head unless head.nil?
  end

  def add node
    @tail = @head = Node.new(node) and return if @head.nil?
    @tail.next_node = Node.new(node)
    @tail = @tail.next_node
  end

  def shift node
    node = Node.new(node)
    @tail = @head = node and return if @head.nil?
    node.next_node = @head
    @head = node
    self.reset!
  end

  def next_node
    @current_node = @current_node.next_node
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
    prev_node = @head
    current_node = @head.next_node
    until current_node.nil?
      if current_node.value == value
        return prev_node.next_node = current_node.next_node
      end
      prev_node = current_node
      current_node = current_node.next_node
    end
  end

  def reset!
    @current_node = @head
  end
end
