class Queue
  attr_reader :first, :last
  def initialize(node = nil)
    @first = @last = node unless node.nil?
  end

  def enqueue(node)
    @first = @last = node and return if first.nil?
    @last.next = node
    @last = last.next
  end

  def dequeue
    return nil if first.nil?
    data = first.data
    @first = first.next
    @last = nil if first.nil?
    data
  end

  def peek
    return nil if first.nil?
    first.data
  end

end