class StringBuffer

  attr_accessor :buffer
  def initialize
    @buffer = []
  end

  def append word
    buffer.push word
  end

  def to_s
    buffer.inject("", :<<)
  end
end
