# Assume you have a method <string>.include? which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to <string>.include? (e.g., "waterbottLe" is a rotation of "erbottLewat")

module Strings
  extend self
  def rotation? str1, str2
    return false if str1.length != str2.length || str1.length.zero?
    "#{str1}#{str1}".include?(str2)
  end
end
