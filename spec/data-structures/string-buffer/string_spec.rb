require_relative '../../spec_helper'
describe String do

  let(:string_1) { "test" }
  let(:string_2) { "experiment" }
  let(:my_words) { [string_1, string_2] }
  describe '.join_words' do
    it 'returns a string' do
      expect(String.join_words my_words).to eq my_words.join("")
    end
  end

end