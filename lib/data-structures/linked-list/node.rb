class Node
  attr_reader :value
  attr_accessor :next, :prev
  def initialize value
    @value = value
    @next = nil
  end
end
