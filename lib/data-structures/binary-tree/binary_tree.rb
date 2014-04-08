class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(node)
    parent = nil
    current_node = self.root
    until current_node.nil?
      parent = current_node
      if node.key < current_node.key
        current_node = current_node.left
      else
        current_node = current_node.right
      end
    end
    if parent.nil? # tree was empty
      self.root = node
    elsif node.key < parent.key
      parent.left = node
    else
      parent.right = node
    end
  end
end