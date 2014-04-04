require_relative 'node'
class DoublyLinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize head=nil
    add_first_node(head) unless head.nil?
  end

  def push_bottom node
    add_first_node(node) if @head.nil?
    @tail.next = Node.new(node)
    @tail.next.prev = @tail
    @tail = @tail.next
  end

  def push_top node
    node = Node.new(node)
    add_first_node(node) if @head.nil?
    node.next = @head
    @head.prev = node
    @head = node
  end

  def find data
    self.detect {|node| node.data == data }
  end

  def each
    return @head if @head.nil?
    current_node = @head
    until current_node.nil?
      yield current_node
      current_node = current_node.next
    end
  end

  def remove data
    @head = @head.next and return if @head.data == data
    node = self.find(data) || return
    next_node = node.next
    prev = node.prev
    next_node.prev = node.prev if next_node
    prev.next = node.next
  end

  private

  def add_first_node(node)
    @tail = @head = Node.new(node)
  end
end
