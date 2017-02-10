class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue << element
    @head = element
  end

  def dequeue
    num = @queue.first
    @queue.delete_at(num)
  end

  def empty?
    @queue.empty?
  end
end
