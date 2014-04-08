require_relative '../../spec_helper'

describe BinaryTree do
  let(:tree) { BinaryTree.new }
  let(:node) { TreeNode.new(5) }
  let(:small_node) { TreeNode.new(2) }
  let(:big_node) { TreeNode.new(7) }
  let(:middle_node) { TreeNode.new(6) }
  let(:node_array) { [node, small_node, big_node, middle_node] }

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
      node_array.each { |node| tree.insert(node) }
    end

    it "returns the node with a key equal to the searched value" do
      expect(tree.search(7)).to eq big_node
    end

    it "returns nil if a node with a key equal to the searched value is not found" do
      expect(tree.search(3)).to be_nil
    end
  end

  context "#maximum" do
    it "returns the node with the largest key in the tree" do
      node_array.each { |node| tree.insert(node) }
      expect(tree.maximum).to eq big_node
    end

    it "returns nil if the tree is empty" do
      expect(tree.maximum).to be_nil
    end
  end

  context "#minimum" do
    it "returns the node with the smallest key in the tree" do
      node_array.each { |node| tree.insert(node) }
      expect(tree.minimum).to eq small_node
    end

    it "returns nil if the tree is empty" do
      expect(tree.maximum).to be_nil
    end
  end

  context "#successor" do
    before(:each) do
      node_array.each { |node| tree.insert(node) }
    end

    it "returns the next largest node" do
      expect(tree.successor(node)).to eq middle_node
    end

    it "returns nil if there is no successor" do
      expect(tree.successor(big_node)).to be_nil
    end
  end

  context "#empty?" do
    it "returns true if the tree is empty" do
      expect(tree).to be_empty
    end

    it "returns false if the true is not empty" do
      tree.insert(node)
      expect(tree).to_not be_empty
    end
  end
end