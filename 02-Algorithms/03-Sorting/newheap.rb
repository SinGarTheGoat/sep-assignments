class Heap

  attr_reader :heap_array
  def initialize
    @heap_array = Array.new
  end

  def insert(num)
    #puts num
    @heap_array << num
    child_index = @heap_array.length - 1
    parent_index = (child_index-1)/2
    if child_index >0
      if @heap_array[child_index] >  @heap_array[parent_index]
        swap_up(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
      end
    end
  end

  def swap_up(child, child_index, parent, parent_index)
    temp = @heap_array[parent_index] #these two lines save the nodes to be swaped in tempoary varibles
    temp2 = @heap_array[child_index]
    @heap_array[parent_index] = temp2#these two lines assigns the temp varibles to their new places in the array
    @heap_array[child_index] = temp

    grandpa_index = (parent_index-1)/2 #Just like in the insert method now we find what the parent index of our swaped node is

    if grandpa_index >=0 #As before in the insert method this line ensures we do not go wrap around the array
      if child > @heap_array[grandpa_index] # Checks to see if swap_up function needs to be recursivly called
        swap_up(@heap_array[parent_index], parent_index ,@heap_array[grandpa_index], grandpa_index) #sends new nodes back Through swap_up method
      end
    end
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

  def swap_down(index)
    puts "in swap down"

    r_child = @heap_array[find_right_child(index)] # these two lines use the find_left_child & find_right_child functions
    l_child = @heap_array[find_left_child(index)] ##to find the child nodes of the node that was just swaped with the deleted node

    if l_child > r_child # determins witch of the two nodes to swap

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
        if @heap_array[the_chosen_index] > @heap_array[find_right_child(the_chosen_index)] || @heap_array[the_chosen_index] > @heap_array[find_left_child(the_chosen_index)] #determins if the newly swaped node is less than its child
          swap_down(the_chosen_index) #Sends the new index recursivly back into the function
        end
      end
    end
  end


  def pop
    largest = @heap_array.shift #breaks off firs index and saves it in largest
    last = @heap_array.pop #breaks off last index and saves it as last
    @heap_array.unshift(last) #places the last number at the beginning of array

    if @heap_array[1] && @heap_array[2] #if they both exist
      if @heap_array[0]<@heap_array[1] || @heap_array[0]<@heap_array[2]
        if @heap_array[1] > @heap_array[2]
          swap_down(0)
        #   swap_down(@heap_array[1], 1, @heap_array[0], 0)
        # else
        #   swap_down(@heap_array[2], 2, @heap_array[0], 0)
        end
      end
    elsif @heap_array[1]
      if @heap_array[0]<@heap_array[1]
        swap_down(0)
      end
    end
    puts largest
    return largest
  end










  # def pop
  #   puts "pop #{@heap_array.length}"
  #   largest = @heap_array.shift
  #   last = @heap_array.pop
  #   @heap_array.unshift(last)
  #
  #   if @heap_array.length <= 2
  #     "wezzzz hure"
  #     return largest
  #   end
  #
  #   largest = @heap_array.shift
  #   last = @heap_array.pop
  #   @heap_array.unshift(last)
  #   #  puts "@heap_array[0]= #{@heap_array[0]} @heap_array[1]= #{@heap_array[1]} @heap_array[2]= #{@heap_array[2]}"
  #   puts "hey hey #{@heap_array.length}"
  #
  #   if @heap_array[0]<@heap_array[1] || @heap_array[0]<@heap_array[2]
  #     if @heap_array[1] > @heap_array[2]
  #       swap_up(@heap_array[1], 1, @heap_array[0], 0)
  #     else
  #       swap_up(@heap_array[2], 2, @heap_array[0], 0)
  #     end
  #   end
  #   return largest
  # end

  def sorted_list
    sorted = []
     @heap_array.each do |x|
      sorted << pop
      puts "hello from sorted list"
    end
    return sorted
  end
end


heep = Heap.new

ray=(1..10).to_a.shuffle!
ray.each do |number|
  #puts "inserting #{number}"
  heep.insert(number)
end
p heep.heap_array
p heep.sorted_list

#heep.insert
