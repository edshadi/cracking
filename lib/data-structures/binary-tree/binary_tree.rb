class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(node)
    parent = find_parent(node)
    if parent.nil? # tree was empty
      self.root = node
    elsif node.key < parent.key
      parent.left = node
    else
      parent.right = node
    end
  end

  def search(value, node=self.root)
    while node != nil && value != node.key
      if value < node.key
        node = node.left
      else
        node = node.right
      end
    end
    node
  end

  def maximum(node=root)
    return nil if self.root == nil
    until node.right.nil?
      node = node.right
    end 
    node
  end

  def minimum(node=root)
    return nil if self.root == nil
    until node.left.nil?
      node = node.left
    end
    node
  end

  def successor(node)
    return minimum(node.right) if node.right != nil
    parent = node.parent
    while parent != nil && node == parent.right
      node = parent
      parent = node.parent
    end
    parent
  end

  def tree_walk(root=self.root)
    unless root.nil?
      tree_walk(root.left)
      puts root.key
      tree_walk(root.right)
    end
  end

  def empty?
    self.root.nil?
  end

  private

  def find_parent(node)
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
    parent
  end
end