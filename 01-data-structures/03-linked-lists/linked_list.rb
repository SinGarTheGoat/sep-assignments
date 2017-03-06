require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  attr_accessor :current
  attr_accessor :bob
  def initialize(*args)
    @current = nil
    @bob = []
  end
  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
   def add_to_tail(node)

    if(@tail)
      @tail.next = node
      @tail = node
    else
      @head = node
      @tail= node
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail

    current_node = @head
    if @head == nil #empty lit
      return nil
    end
    if @head.next == nil #list of one
      temp = @head
      @head = nil
      @tail = nil
      return temp
    end
    while(current_node.next.next) #to traverse the list
      current_node = current_node.next
    end
    temp_two = current_node.next
    current_node.next = nil
    @tail = current_node
      return temp_two
  end

  # preivous_node.next -> @tail.next -> nil
  # previous_node.next -> node.next -> successor
  # previous_node.next =successor

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

  #takes node to be deleted
  #compairs passed node to head node
  #if they match delete that node and point
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

            if examined_node.next == nil

              else

                examined_node = examined_node.next
            end
            after_examined_node = examined_node.next

            if examined_node == node
              temp = before_examined_node
              before_examined_node.next = after_examined_node
            end
          end
    end
  end
  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
        if @head == nil
          return add_to_tail(node)
        else
          old_head = @head
          @head = node
          @head.next = old_head
          return
        end
  end
  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end

  def insert_node_index_specfic(node, index)
    counter = 0
    if index == 0
        add_to_front(node)
      else
        examined_node = @head
        after_examined_node = @head.next
        while counter != index do
          counter = counter+1
          before_examined_node = examined_node
          examined_node = examined_node.next
          after_examined_node = examined_node.next
        end
        before_examined_node.next = node
        node.next = after_examined_node
      end
  end

  def return_at(index)
    counter = 0
    if counter == index
      puts @head.data
    else
      current = @head
      while counter != index do
        counter = counter+1
        if current.next == nil
          break
        else
          current = current.next
        end
      end
      puts current.data
    end
  end

  def delete_at(index)
    counter = 0
    current = @head
    if counter == index
      @head = @head.next
    else
      while counter < index do

        previous = current
        current = current.next
        counter = counter+1

        if counter =index
          if current = nil
            return
          end
          previous.next =current.next
        end
      end
    end

  end


end
