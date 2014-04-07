require_relative '../../spec_helper'
describe StringBuffer do

  let(:string_buffer) { StringBuffer.new }
  let(:word) { 'test' }
  describe '#initialize' do
    it 'creates an empty buffer array' do
      expect(string_buffer.buffer).to be_empty
    end
  end

  describe '#append' do
    it 'adds a word to the buffer array' do
      buffer = string_buffer.buffer
      expect{
        string_buffer.append word
      }.to change{ buffer.count }.by 1
    end
  end

  describe '#to_s' do
    context 'with a populated buffer' do
      it 'returns a string of all words in the buffer' do
        string_buffer.append word
        expect(string_buffer.to_s).to eq word
      end
    end

    context 'with an empty buffer' do
      it 'raises an EmptyBufferError' do
        expect(string_buffer.to_s).to be_empty
      end
    end
  end
end
