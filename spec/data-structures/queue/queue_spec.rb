require_relative '../../spec_helper'

describe Queue do

  let(:first) { Node.new(5) }
  let(:last) { Node.new(3) }
  let(:empty_queue) { Queue.new }
  let(:single_queue) { Queue.new(first) }
  let(:multiple_queue) do
    queue = Queue.new(first)
    queue.enqueue(last)
    queue
  end

  describe '#enqueue' do
    context 'empty queue' do
      it 'sets first to queued node' do
        empty_queue.enqueue(first)
        expect(empty_queue.first).to eq first
      end

      it 'sets last to queued node' do
        empty_queue.enqueue(first)
        expect(empty_queue.last).to eq first
      end
    end

    before(:each){ single_queue.enqueue(last) }
    context 'queue with nodes' do
      it 'sets last to the queued node' do
        expect(single_queue.last).to eq last
      end

      it 'does not set first to the queued node' do
        expect(single_queue.first).to_not eq last
      end
    end
  end


  describe '#dequeue' do
    context 'empty queue' do
      it 'returns nil' do
        expect(empty_queue.dequeue).to be_nil
      end
    end

    context 'queue with one node' do
      it 'changes last to be nil' do
        expect {
          single_queue.dequeue
        }.to change{ single_queue.last }.to be_nil
      end
    end

    it "returns the dequeued node's data" do
      data = multiple_queue.first.data
      expect(multiple_queue.dequeue).to eq data
    end
  end

end