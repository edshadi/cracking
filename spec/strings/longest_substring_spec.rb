require_relative '../spec_helper'

describe Strings do
  context '#longest_substring' do
    it 'should return an empty string if an empty string is given' do
      expect(Strings.longest_substring('')).to eq ''
    end

    it 'should handle single letter strings of length 1' do
      expect(Strings.longest_substring('a')).to eq 'a'
    end

    it 'should handle single letter strings of length > 1' do
      expect(Strings.longest_substring('aaaaa')).to eq 'a'
    end    

    it 'should return the entire string for unique-character-strings' do
      expect(Strings.longest_substring('abcd')).to eq 'abcd'
    end

    it 'should return the longest substring in a string with repeated characters' do
      expect(Strings.longest_substring('abcdecfgh')).to eq 'decfgh'
    end

    it 'should return the first largest substring for multiple substrings of max legnth' do
      expect(Strings.longest_substring('abcdecfg')).to eq 'abcde'
    end
  end
end