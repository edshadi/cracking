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

  def search(value, root=self.root)
    while root != nil && value != root.key
      if value < root.key
        root = root.left
      else
        root = root.right
      end
    end
    root
  end

  def tree_walk(root=self.root)
    unless root.nil?
      tree_walk(root.left)
      puts root.key
      tree_walk(root.right)
    end
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