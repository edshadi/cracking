require_relative '../../spec_helper'

describe BinaryTree do
  let(:tree) { BinaryTree.new }
  let(:node) { TreeNode.new(5) }
  let(:small_node) { TreeNode.new(2) }
  let(:big_node) { TreeNode.new(7) }
  let(:middle_node) { TreeNode.new(6) }

  it "initializes with a nil root" do
    expect(tree.root).to be_nil
  end

  context "#insert" do
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

  context "#search" do
    before(:each) do
      tree.insert(node)
      tree.insert(small_node)
      tree.insert(big_node)
      tree.insert(middle_node)
    end

    it "returns the node with a key equal to the searched value" do
      expect(tree.search(7)).to eq big_node
    end

    it "returns nil if a node with a key equal to the searched value is not found" do
      expect(tree.search(3)).to be_nil
    end
  end
end