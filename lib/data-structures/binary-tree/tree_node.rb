class TreeNode
  attr_reader :key
  attr_accessor :parent, :left, :right

  def initialize(key)
    @key = key
    @parent = nil
    @left = nil
    @right = nil
  end
end