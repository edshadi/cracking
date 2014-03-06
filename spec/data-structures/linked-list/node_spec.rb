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
end
