require_relative '../../spec_helper'

describe Stack do 
  let(:stack) { Stack.new(4) }

  it "initializes empty" do
    expect(stack.empty?).to eq true
  end

  context "#push" do
    it "pushes an element into the stack" do
      stack.push(1)
      expect(stack.empty?).to eq false
    end

    it "raises a stack overflow error if the stack is full" do
      expect { 5.times { stack.push("hi")} }.to raise_error
    end
  end

  context "#pop" do
    it "returns the last element pushed into the stack" do
      3.times { |i| stack.push(i) }
      expect(stack.pop).to eq 2
    end

    it "raises a stack underflow error if the stack is empty" do
      expect { stack.pop }.to raise_error
    end
  end
end