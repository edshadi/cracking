require_relative '../../spec_helper'

describe Stack do 
  let(:stack_size) { 4 }
  let(:stack) { Stack.new(stack_size) }

  it "initializes empty" do
    expect(stack).to be_empty
  end

  context "#push" do
    let(:element) { 1 }
    it "pushes an element into the stack" do
      stack.push(element)
      expect(stack).to_not be_empty
      expect(stack.pop).to eq 1
    end

    it "raises a stack overflow error if the stack is full" do
      overflow_size = stack_size + 1
      expect { overflow_size.times { stack.push("hi")} }.to raise_error(StackOverflow)
    end
  end

  context "#pop" do
    it "returns the last element pushed into the stack" do
      ["cat", "dog", "ferret"].each { |animal| stack.push(animal) }
      expect(stack.pop).to eq "ferret"
    end

    it "raises a stack underflow error if the stack is empty" do
      expect { stack.pop }.to raise_error(StackUnderflow)
    end
  end
end