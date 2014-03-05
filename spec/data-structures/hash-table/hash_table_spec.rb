require_relative '../../spec_helper'
describe HashTable do
  let(:key) { :a }
  let(:value) { ":a value" }
  let(:table) { HashTable.new }
  context "#[]=" do
    before(:each) do
      table[key] = value
    end
    it "adds the value under the key" do
      expect(table[key]).to eq value
    end
    it "values don't override each other override" do
      table["a"] = "a value"
      table["A"] = "A value"
      expect(table[key]).to eq value
      expect(table["a"]).to eq "a value"
    end
  end
  context "#[]" do
    before(:each) do
      table[key] = value
    end
    it "gets the value at the given key" do
      expect(table[key]).to eq value
    end
  end

  context "#hash" do
    it "returns 0 if the array is empty" do
      expect(table.hash_func(key)).to eq key.length % 10
    end

    it "mods the length of the array" do
      table[key] = value
      table["another_key"] = value
      expect(table.hash_func(key)).to eq key.length % 10
    end
  end
end
