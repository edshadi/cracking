require_relative '../../spec_helper'
describe String do

  let(:string_1) { "test" }
  let(:string_2) { "experiment" }
  let(:words) { [string_1, string_2] }
  describe '.join_words' do
    it 'returns a string' do
      expect(String.join_words words).to eq words.join("")
    end
  end

end