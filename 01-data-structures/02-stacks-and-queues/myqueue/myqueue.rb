class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue.unshift(element)
    @head = element
    @tail = @queue.last

  end

  def dequeue
    num = @queue.last
    num.to_i
    @queue.drop(num)
  end

  def empty?
    @queue.empty?
  end
end
