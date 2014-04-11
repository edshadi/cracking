require_relative '../spec_helper'

describe Strings do
  let(:alphabet){("a".."z").to_a.join}
  context '#longest_substring' do
    it 'should handle alphabetic inputs' do
      expect{Strings.longest_substring(alphabet)}.to_not raise_error
    end

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

    it 'should raise an Arguement error if the string contains non-alphabetic letters' do
      expect{Strings.longest_substring('abc?de')}.to raise_error(ArgumentError)
    end

    it 'should raise an Argument error with have a custom message' do
      expect{Strings.longest_substring('abc?de')}.to raise_error(ArgumentError, 'Input can only contain alphabetic letters')
    end
  end
end