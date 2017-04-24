require_relative 'array_nodes'
require 'pry'

class Heap
  attr_reader :heap_array
  def initialize
    @heap_array = Array.new
  end

  def insert(node)
    @heap_array << node
    child_index = @heap_array.length - 1
    parent_index =   (child_index-1)/2
    if child_index >0
      if @heap_array[child_index].rating <  @heap_array[parent_index].rating
        swap_up(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
      end
    end
  end

  def swap_up(child, child_index, parent, parent_index)

    temp = @heap_array[parent_index]
    temp2 = @heap_array[child_index]
    @heap_array[parent_index] = temp2
    @heap_array[child_index] = temp

    grandpa_index = (parent_index-1)/2
    if grandpa_index >=0
        if child.rating < @heap_array[grandpa_index].rating
          swap_up(@heap_array[parent_index], parent_index ,@heap_array[grandpa_index], grandpa_index)
        end
      end
  end

  def pop
    delete(@heap_array[0])
  end

  def find_left_child(index)
    2 * index + 1
  end

  def find_right_child(index)
     2 * index + 2
  end

  def is_a_leaf?(index)
    index >=(@heap_array.length-1)/2
  end

  def delete(node)
    where_it_at = @heap_array.index(node)   # finds the index of the node to be deleted
    if @heap_array.include?(node)   #checks array to see if its in there
      unless is_a_leaf?(where_it_at) then
        deleted_one = @heap_array[where_it_at]  #the deleted node to be returned
        @heap_array[where_it_at] = @heap_array.last
        @heap_array.delete_at(@heap_array.length-1)
        r_child = @heap_array[find_right_child(where_it_at)]
        l_child = @heap_array[find_left_child(where_it_at)]
        if @heap_array[where_it_at].rating > r_child.rating ||@heap_array[where_it_at].rating > l_child.rating
          swap_down(where_it_at)
        end
      else
        @heap_array.delete(node)
      end
    end
    return deleted_one
  end


  def swap_down(index)
    puts "in swap down"
    r_child = @heap_array[find_right_child(index)]
    l_child = @heap_array[find_left_child(index)]
    if l_child.rating < r_child.rating
      temp = @heap_array[index]
      temp2 = l_child
      @heap_array[index] = temp2
      @heap_array[find_left_child(index)] = temp
      the_chosen_index = find_left_child(index)
    else
      temp = @heap_array[index]
      temp2 = r_child
      @heap_array[index] = temp2
      @heap_array[find_right_child(index)] = temp
      the_chosen_index = find_right_child(index)
    end

    unless is_a_leaf?(index)  then
      if @heap_array[find_right_child(the_chosen_index)] && @heap_array[find_left_child(the_chosen_index)]
        if @heap_array[the_chosen_index].rating < @heap_array[find_right_child(the_chosen_index)] || @heap_array[the_chosen_index].rating < @heap_array[find_left_child(the_chosen_index)]
          swap_down(the_chosen_index)
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
