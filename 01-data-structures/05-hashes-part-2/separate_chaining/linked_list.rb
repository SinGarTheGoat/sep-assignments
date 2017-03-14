require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  attr_accessor :current

  def initialize(*args)
    @current = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if(@tail)
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail = node
    end
  end





  # This method prints out a representation of the list.
  def print
    elements =[]
    current = @head
    while current != nil
      elements << current
      current = current.next
    end
      elements.each{|x| puts x.data}
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    examined_node = @head
    after_examined_node = @head.next
    if examined_node == node #to be deleted item is first on the list
      remove_front()
    elsif node == @tail
      remove_tail()
    else
      while examined_node != node
        before_examined_node = examined_node
        examined_node = examined_node.next
        after_examined_node = examined_node.next
        if examined_node == node
          temp = before_examined_node
          before_examined_node.next = after_examined_node
        end
      end
    end
  end



end
