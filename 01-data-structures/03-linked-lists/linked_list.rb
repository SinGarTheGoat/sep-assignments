require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail
  bob = []
  current = nil 
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
   def add_to_tail(node)
    if(@next)
       @tail.next = node
    else
      @tail= node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    #@tail.next = nil



  #   if(@next)
  #      @tail.next = node
  #   else
  #     while(@tail.next) && (@tail.next.next == nil)
  #       @tail.next = nil
  #     end
  #   end
  #
   end

  # This method prints out a representation of the list.
   def print


    #  while   @head != nil
    #    print @head.data
    #  end
    #
    # elements =[]
    # current = @next
    # while current != nil
    #   elements << current
    #   current = current
    # end
    # elements<< current
    # elements.each{|x| puts x}

     end


  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    current.next =@head
    if current.node = node
      @head =current.next
    else
      while (current.next != nil)&&(current.next.node != val)
        current = current.next
      end
      unless current.next == nil
        current.next =current.next.next
      end
    end

  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @head.next = lulz
    @head = node
    lulz = @head.next
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next_node

  end
end
