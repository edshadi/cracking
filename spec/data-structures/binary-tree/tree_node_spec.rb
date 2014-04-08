require_relative '../../spec_helper'

describe TreeNode do 
 let(:node) { TreeNode.new("apples") }

 it "initializes with the assigned key" do
  expect(node.key).to eq "apples"
 end

 it "initializes with a nil parent" do
  expect(node.parent).to be_nil
 end

 it "initializes with a nil left child" do
  expect(node.left).to be_nil
 end

 it "initializes with a right child" do
  expect(node.right).to be_nil
 end

 it "cannot change the value of the key after initialization" do
  expect{ node.key = "bananas" }.to raise_error(NoMethodError)
 end
end