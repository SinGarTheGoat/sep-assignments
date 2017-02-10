class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack << item
    self.top = item
  end

  def pop
    len = @stack.length - 1
    @stack.delete_at(len)
    self.top = @stack.last
  end


  def empty?
    @stack.empty?
  end
end
