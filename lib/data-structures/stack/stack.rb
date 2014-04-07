class Stack 
  def initialize(length)
    @length = length
    @stack = []
    @top = 0
  end

  def empty?
    @top == 0 ? true : false
  end

  def push(value)
    raise "Stack overflow" if @top == @length
    @top += 1
    @stack[@top] = value
  end

  def pop
    raise "Stack underflow" if self.empty?
    @top -= 1
    @stack[@top + 1]
  end
end