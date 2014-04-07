class Stack 
  def initialize(length)
    @length = length
    @stack = []
    @top = 0
  end

  def empty?
    @top.zero?
  end

  def push(value)
    raise StackOverflow if @top == @length
    @top += 1
    @stack[@top] = value
  end

  def pop
    raise StackUnderflow if self.empty?
    @top -= 1
    @stack[@top + 1]
  end

  def peek
    @stack[@top]
  end
end

class StackOverflow < StandardError;end
class StackUnderflow < StandardError;end