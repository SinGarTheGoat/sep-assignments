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
    len = @stack.length
    upDog = self.top
    @stack.delete_at(len-1)
    self.top = @stack.last
    #puts self.top
    upDog
  end


  def empty?
    @stack.empty?
  end
end
