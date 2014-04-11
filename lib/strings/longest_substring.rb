# without using enumerables, find the longest substring in a string that does
# not contain any repeated characters (only lowercase a-z). for example, in
# 'abcdecfgh', the longest substring without repeated characters is 'decfgh'
# (length 6). if two substrings have the same length, then the first is
# returned, for example in 'abcdecfg', 'abcde' and 'decfg' are the longest
# substrings, but only 'abcde' is returned

module Strings
  extend self
  def longest_substring string
    string = string.downcase
    alphabet = ('a'..'z').to_a
    unless string.split("").all?{|char| alphabet.include?(char)}
      raise ArgumentError, 'Input can only contain alphabetic letters' 
    end
    i = 0
    substr, longest = "", ""
    while i < string.length
      if substr.include?(string[i])
        substr = substr.split(string[i]).last || ""
      end
      substr += string[i]
      longest = substr if longest.length < substr.length
      i+=1
    end
    longest
  end
end
