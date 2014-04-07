class StringBuffer

  attr_accessor :buffer
  def initialize
    @buffer = []
  end

  def append word
    buffer.push word
  end

  def to_s
    sentence = ""
    buffer.each do |word|
      sentence.concat(word) # or shovel operator <<
    end
    sentence
  end
end
