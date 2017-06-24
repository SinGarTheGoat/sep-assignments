
class Node
  attr_accessor :title
  attr_accessor :rating
  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end


class Heapsort

  attr_reader :heap_array
  def initialize
    @heap_array = Array.new #We will use this array to hold the nodes that make up our heap
  end

  def insert(node)
    @heap_array << node #Every node starts by being enterd into the last index of the array

    child_index = @heap_array.length - 1 #This varible identifies what index the incoming node is at.
    parent_index = (child_index-1)/2 # Through the magic of intiger division this equastion calculates the parent index of the incoming node

    if child_index >0 #this checks to make sure the child index does not wrap behind an array and read the wrong index
      if @heap_array[child_index].rating <  @heap_array[parent_index].rating #this checks if the incoming child node has a lower rating than it's parent node
        swap_up(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index) #If the nodes needs to be swaped it passes the nodes and their indices to the swap_up method
      end
    end
    # string = ""
    # @heap_array.each do  |x|
    #   string << "#{x.rating }, "
    #
    # end
    # p string




  end

  def swap_up(child, child_index, parent, parent_index)

    temp = @heap_array[parent_index] #these two lines save the nodes to be swaped in tempoary varibles
    temp2 = @heap_array[child_index]
    @heap_array[parent_index] = temp2#these two lines assigns the temp varibles to their new places in the array
    @heap_array[child_index] = temp

    grandpa_index = (parent_index-1)/2 #Just like in the insert method now we find what the parent index of our swaped node is

    if grandpa_index >=0 #As before in the insert method this line ensures we do not go wrap around the array
      if child.rating < @heap_array[grandpa_index].rating # Checks to see if swap_up function needs to be recursivly called
        swap_up(@heap_array[parent_index], parent_index ,@heap_array[grandpa_index], grandpa_index) #sends new nodes back Through swap_up method
      end
    end
  end

  def pop
    ggg = @heap_array[0]
    @heap_array[0] = @heap_array.pop
    swap_down(0)
    return ggg
    # delete(@heap_array[0])
  end

  def sorted_list
    sorted_array = []

    while @heap_array != nil
      sorted_array << pop
      puts "wat up"
      # p sorted_array.map { |e|
      #   e.rating
      # }
    end
    puts sorted_array.length
  end



  def find_left_child(index) #finds left child for a given index, is called by delete function
    2 * index + 1
  end

  def find_right_child(index) #finds right child for a given index, is called by delete function
    2 * index + 2
  end

  def is_a_leaf?(index) #if a node is a leaf it is on the bottom row of our heap, is called by delete function
    index >=(@heap_array.length-1)/2
  end

  def delete(node)
    puts "in delete"
    if @heap_array.include?(node)   #checks array to see if its in the heap, if not function returns false

      where_it_at = @heap_array.index(node) # finds the index of the node to be deleted

      unless is_a_leaf?(where_it_at) then #sends index to is_a_leaf? function where it determins if the node being deleted is on the bottom row
        deleted_one = @heap_array[where_it_at]  # saves the deleted node in a varible to be returned later

        @heap_array[where_it_at] = @heap_array.last #here we swap the last node in our heap for the node being deleted
        @heap_array.delete_at(@heap_array.length-1) #we delete the node we just swapped so it does not appear twice in the heap

        r_child = @heap_array[find_right_child(where_it_at)] # these two lines use the find_left_child & find_right_child functions
        l_child = @heap_array[find_left_child(where_it_at)]#to find the child nodes of the node that was just swaped with the deleted node

        if @heap_array[where_it_at].rating > r_child.rating ||@heap_array[where_it_at].rating > l_child.rating #determines if either of the child nodes have a lower raitng than the node that was swapped
          swap_down(where_it_at) #This sends the index of our newly swaped node to the recursive function to carry out more swapping of nodes
        end
      else
        @heap_array.delete(node) # If the node to be deleted is a leaf node it is simply deleted and thanks to rubys functionality the array is compressed
        #I think this is where my sin lies.
      end
    else
      return false #returns false if node is not in array.
    end
    return deleted_one #returns the deleted node
  end


  def swap_down(index) # A recursive function called by the delete function
  #  puts 'swap_down'
    left = 2 * index + 1
    right = 2 * index + 2



  #  p @heap_array.map{|n| n.rating}
    r_child = @heap_array[find_right_child(index)] # these two lines use the find_left_child & find_right_child functions
    puts "find_right_child(index)=#{find_right_child(index)}"
    l_child = @heap_array[find_left_child(index)] ##to find the child nodes of the node that was just swaped with the deleted node
    puts "find_left_child=#{find_left_child}"

    if l_child.rating < r_child.rating # determins witch of the two nodes to swap

      temp = @heap_array[index] #These four lines save the nodes to be swaped in temp nodes
      temp2 = l_child            #and then swaps their places in the array
      @heap_array[index] = temp2
      @heap_array[find_left_child(index)] = temp

      the_chosen_index = find_left_child(index) #The chosen index refers to the next indice that needs to be compaired and possibly swapped
    else

      temp = @heap_array[index] #These four lines save the nodes to be swaped in temp nodes
      temp2 = r_child            #and then swaps their places in the array
      @heap_array[index] = temp2
      @heap_array[find_right_child(index)] = temp

      the_chosen_index = find_right_child(index)  #The chosen index refers to the next indice that needs to be compaired and possibly swapped
    end

    unless is_a_leaf?(index)  then #calls is_a_leaf? method to determine if we are at the bottom of the heap

      if @heap_array[find_right_child(the_chosen_index)] && @heap_array[find_left_child(the_chosen_index)] # determins if the child indices exist otherwise we will get an error
        if @heap_array[the_chosen_index].rating < @heap_array[find_right_child(the_chosen_index)].rating || @heap_array[the_chosen_index].rating < @heap_array[find_left_child(the_chosen_index)].rating #determins if the newly swaped node is less than its child
          swap_down(the_chosen_index) #Sends the new index recursivly back into the function
        end
      end
    end
  end

  def find(node)  #For this method should it print out if found and return nil if not found
    find_it = false
    @heap_array.each do |nood|
      if node == nood
        puts "#{nood.title} #{nood.rating}"
        find_it = true
        return find_it
      end

      return false
      find_it = false
    end
  end

  def print
    @heap_array.each do |node|
      puts "#{node.title} #{node.rating}"
    end
  end
end
