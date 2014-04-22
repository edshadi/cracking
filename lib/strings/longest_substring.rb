# find the longest substring in a string that does
# not contain any repeated characters (only lowercase a-z). for example, in
# 'abcdecfgh', the longest substring without repeated characters is 'decfgh'
# (length 6). if two substrings have the same length, then the first is
# returned, for example in 'abcdecfg', 'abcde' and 'decfg' are the longest
# substrings, but only 'abcde' is returned

module Strings
  extend self
  def longest_substring string
    characters = string.split("").map(&:downcase)
    alphabet = ('a'..'z').to_a
    substr, longest = "", ""
    unless characters.all?{|char| alphabet.include?(char)}
      raise ArgumentError, 'Input can only contain alphabetic letters' 
    end
    characters.each do |letter|
      if substr.include?(letter)
        substr = substr.split(letter).last || ""
      end
      substr += letter
      longest = substr if longest.length < substr.length
    end
    longest
  end
end
