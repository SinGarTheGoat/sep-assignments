




require_relative 'array_nodes'
require 'pry'

class Heap
  attr_reader :heap_array
  def initialize
    @heap_array = Array.new
  #  @first_time = true
  end

  def insert(node)
    @heap_array << node
    start_index = @heap_array.length - 1
    child_index = start_index
    parent_index = (child_index/2)
    # puts start_index
    # puts @heap_array.last.title

    if start_index.even?  #is a right node
      child_index = (@heap_array.length - 1)
      parent_index = (child_index/2)
      if @heap_array[parent_index]  #makes sure this evaluates to true
        # puts "is in first if & is a right"
        if @heap_array[child_index].rating <  @heap_array[parent_index].rating  #child (incoming node) is smaller send to the swap
          # puts "WEZZZZ NEVER HERE"
          swap(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
        end
      end
    else #is a left node
      child_index = (@heap_array.length - 1)
      parent_index = (child_index/2)
      # puts "is in the else & is a left"
      if @heap_array[child_index].rating < @heap_array[parent_index].rating     #child is bigger send to the swap
        # puts "WEZZZZ NEVER HERE"
        swap(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
      end
    end
  end


  def swap(child, child_index, parent, parent_index)
    #puts "#{child.title} is in swap"
    if parent_index.size.odd?
      grandpa_index = (parent_index/2)
    else
      grandpa_index = (parent_index/2)
    end


    if  @node_array[grandpa_index] && child.rating < @node_array[grandpa_index].rating
      temp = @node_array[parent_index]
      temp2 = @node_array[child_index]
      @node_array[parent_index] = temp2
      @node_array[child_index] = temp
      switch(grandpa, grandpa_index,@node_array[parent_index], parent_index)
    else
      temp = @node_array[parent_index]
      temp2 = @node_array[child_index]
      @node_array[parent_index] = temp2
      @node_array[child_index] = temp
    end



  end


  def delete(node)
  end

  def find(node)  #For this method should it print out if found and return nil if not found
  end

  def print
  end




end





# require_relative 'array_nodes'
# require 'pry'
#
# class Heap
#   attr_reader :heap_array
#   def initialize
#     @heap_array = Array.new
#
#   end
#
#   def insert(node)
#
#     @heap_array << node
#       start_index = @heap_array.length - 1
#       puts start_index
#       puts @heap_array.last.title
#
#       if start_index.even?  #is a right node
#         child_index = (@heap_array.length - 1)
#         parent_index = ((child_index+2)/2)
#
#       #if @heap_array[parent_index]  #makes sure this evaluates to true
#
#           puts "is in first if & is a right"
#           if @heap_array[child_index].rating <  @heap_array[parent_index].rating  #child (incoming node) is smaller send to the swap
#             puts "WEZZZZ NEVER HERE"
#             swap(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
#
#           end
#         #end
#       else      #is a left node
#         child_index = (@heap_array.length - 1)
#         parent_index = ((child_index+1)/2)
#         puts "is in the else & is a left"
#         if   @heap_array[child_index].rating < @heap_array[parent_index].rating     #child is bigger send to the swap
#           puts "WEZZZZ NEVER HERE"
#           swap(@heap_array[child_index], child_index, @heap_array[parent_index], parent_index)
#
#         end
#       end
#   end
#
#
#   def swap(child, child_index, parent, parent_index)
#     #puts "#{child.title} is in swap"
#     if parent_index.size.odd?
#       grandpa_index = (parent_index+1)/2
#     else
#       grandpa_index = (parent_index+2)/2
#     end
#
#
#     if child.rating < grandpa.rating
#       temp = @node_array[parent_index]
#       temp2 = @node_array[child_index]
#       @node_array[parent_index] = temp2
#       @node_array[child_index] = temp
#       switch(grandpa, grandpa_index,@node_array[parent_index], parent_index)
#     else
#       temp = @node_array[parent_index]
#       temp2 = @node_array[child_index]
#       @node_array[parent_index] = temp2
#       @node_array[child_index] = temp
#     end
#
#
#
#   end
#
#
#   def delete(node)
#   end
#
#   def find(node)  #For this method should it print out if found and return nil if not found
#   end
#
#   def print
#   end
#
#
#
#
# end
