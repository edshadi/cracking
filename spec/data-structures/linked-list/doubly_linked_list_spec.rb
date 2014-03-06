require_relative '../../spec_helper'
describe Node do
  let(:value) { "sweet" }
  let(:next_node) { "awesome" }
  let(:node) { Node.new value }
  context "#value" do
    it "is initialized to the given value" do
      expect(node.value).to eq value
    end
  end
  context "#next" do
    it "defaults to nil" do
      expect(node.next).to be_nil
    end
  end
  context "#next=" do
    it "sets the next" do
      node.next = next_node
      expect(node.next).to eq next_node
    end
  end
  context "#prev_node" do
    it "defaults to nil" do
      expect(node.prev_node).to be_nil
    end
  end
  context "#prev_node=" do
    it "sets the prev_node" do
      previous = "previous"
      node.prev_node = previous
      expect(node.prev_node).to eq previous
    end
  end
end

describe DoublyLinkedList do
  let(:head) { "head" }
  let(:node) { "next" }
  let(:list) { DoublyLinkedList.new head}
  context "#head" do
    it "defaults to nil" do
      list = DoublyLinkedList.new
      expect(list.head).to be_nil
    end
    it "can be set with initial value" do
      expect(list.head.value).to eq head
    end
  end
  context "#tail" do
    it "returns the element at the end of the list" do
      expect(list.tail.value).to eq head
    end
  end
  context "#push_bottom" do
    it "sets head if it's nil" do
      list = DoublyLinkedList.new
      list.push_bottom(head)
      expect(list.head.value).to eq head
    end
    it "head is not affected if it's already set" do
      list.push_bottom(node)
      expect(list.head.value).to eq head
    end
    it "push_bottoms the node to the end of the list" do
      list.push_bottom(node)
      tail = "tail"
      list.push_bottom(tail)
      expect(list.head.next.next.value).to eq tail
    end
    it "is the tail element" do
      list.push_bottom(node)
      tail = "tail"
      list.push_bottom(tail)
      expect(list.tail.value).to eq tail
    end
  end
  context "#push_top" do
    it "sets head if it's nil" do
      list = DoublyLinkedList.new
      list.push_top(head)
      expect(list.head.value).to eq head
    end
    it "sets the head if it's already set" do
      list.push_top(node)
      expect(list.head.value).to eq node
    end
    it "head is the tails element" do
      list.push_top(node)
      expect(list.head.value).to eq node
      expect(list.tail.value).to eq head
    end
    it "is head's previous element" do
      list.push_top(node)
      expect(list.head.next.prev_node).to eq list.head
    end
  end

  context "#find" do
    it "returns the node if value is found" do
      expect(list.find(head).value).to eq head
      list.push_bottom(node)
      expect(list.find(node).value).to eq node
    end
    it "returns nil if value not found" do
      expect(list.find("not there")).to be_nil
    end
  end

  context "#remove" do
    it "removes the head if its the give value" do
      list.push_bottom(node)
      list.remove head
      expect(list.find(head)).to be_nil
      expect(list.head.value).to eq node
    end
    it "removes the node if value is not at head" do
      list.push_bottom("another")
      list.push_bottom(node)
      list.remove node
      expect(list.find(node)).to be_nil
      expect(list.find("another").value).to eq "another"
      expect(list.find(head).value).to eq head
    end
  end

  context "#map" do
    it "yields the block to each element" do
      expect(list.map {|node| node.value }).to eq ["head"]
    end
  end
end
