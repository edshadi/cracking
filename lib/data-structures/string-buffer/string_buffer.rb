class StringBuffer

  attr_accessor :buffer
  def initialize
    @buffer = []
  end

  def append word
    buffer.push word
  end

  def to_s
    raise EmptyBufferError.new("buffer is empty") if buffer.empty?
    sentence = ""
    buffer.each do |word|
      sentence += word
    end
    sentence
  end
end

class EmptyBufferError < StandardError; end
