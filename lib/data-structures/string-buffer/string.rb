require_relative 'string_buffer'
class String

  def self.join_words words
    sentence = StringBuffer.new
    words.each do |word|
      sentence.append word
    end
    sentence.to_s
  end

end
