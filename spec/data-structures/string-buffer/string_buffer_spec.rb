require_relative '../../spec_helper'
describe StringBuffer do

  let(:my_buffer) { StringBuffer.new }
  let(:my_word) { 'test' }
  describe '#initialize' do
    it 'makes a StringBuffer' do
      expect(my_buffer).to be_an_instance_of StringBuffer
    end

    it 'creates an empty buffer array' do
      expect(my_buffer.buffer).to be_empty
    end
  end

  describe '#append' do
    it 'adds a word to the buffer array' do
      buffer = my_buffer.buffer
      expect{
        my_buffer.append my_word
      }.to change{ buffer.count }.by 1
    end
  end

  describe '#to_s' do
    context 'with a populated buffer' do
      before(:each) { my_buffer.append my_word }
      it 'returns a string' do
        expect(my_buffer.to_s).to be_an_instance_of String
      end
      it 'returns a string of all words in the buffer' do
        expect(my_buffer.to_s).to eq my_word
      end
    end

    context 'with an empty buffer' do
      it 'raises an EmptyBufferError' do
        expect{ 
          my_buffer.to_s
        }.to raise_error EmptyBufferError
      end
    end
  end
end
