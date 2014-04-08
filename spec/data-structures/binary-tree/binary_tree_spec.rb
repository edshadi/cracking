require_relative '../../spec_helper'

describe BinaryTree do
  let(:tree) { BinaryTree.new }
  let(:node) { TreeNode.new(5) }

  it "initializes with a nil root" do
    expect(tree.root).to be_nil
  end

  context "#insert" do
    let(:small_node) { TreeNode.new(2) }
    let(:big_node) { TreeNode.new(7) }

    it "assigns the node to root if root is nil" do
      tree.insert(node)
      expect(tree.root).to eq node
    end

    it "assigns the node to parent.left if it is less than parent.key" do
      tree.insert(node)
      tree.insert(small_node)
      expect(tree.root.left).to eq small_node
    end

    it "assigns the node to parent.right if it is greater than parent.key" do
      tree.insert(node)
      tree.insert(big_node)
      expect(tree.root.right).to eq big_node
    end
  end
end