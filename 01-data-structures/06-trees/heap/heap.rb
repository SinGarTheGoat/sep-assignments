require_relative 'node'
class Heap
  attr_reader :node_array

  def initialize(root)
    @root = root
    @node_array = []
  end

  def insert(root, node)
    unless @node_array then #First time through is the onlytime this should trip
      @node_array[0] = root
    end
    come_on_in(node)
  end

  def come_on_in(node)
    num_o_buckets = @node_array.size
    @node_array[num_o_buckets] = (node)  #sets incoming node to the last index in array
    puts @node_array[num_o_buckets].title
    if @node_array.size.even? #here I calculate the parent node if even it is a right node if odd it's a left node
      parent_index = (num_o_buckets-2)/2  #calculates parent index of incoming node
      if @node_array[parent_index].rating > @node_array[num_o_buckets].rating #if the parent node is bigger we need to switch them
        ##
        ##Need to write a node switching algorythymn

        switch(@node_array[parent_index], parent_index , @node_array[num_o_buckets], num_o_buckets)
        ##
      else #in this case incoming node is greater and sets it to first avalible node
        @node_array[parent_index].right = @node_array[num_o_buckets]   #connects the .right propertie of patent node to incoming node
        @node_array[num_o_buckets].is_a_right = @node_array[parent_index] #Sets propertie to know direction of parent node
      end
    else
      parent_index = (num_o_buckets-1)/2
      if @node_array[parent_index].rating > @node_array[num_o_buckets].rating #if the parent node is bigger we need to switch them
        ##
        ##Need to write a node switching algorythymn
        switch(@node_array[parent_index], parent_index , @node_array[num_o_buckets], num_o_buckets)
        ##
      else
        @node_array[parent_index].left = @node_array[num_o_buckets]
        @node_array[num_o_buckets].is_a_left = @node_array[parent_index]
      end
    end
  end

  def switch(parent, parent_index, child, child_index)
    if parent_index.size.even?   #here we find the parent node's parent to check it with incoming node to see if a higher swap is needed
      grandpa =  parent.is_a_right
      grandpa_index = (parent_index-2)/2
    else
      grandpa =  parent.is_a_left
      grandpa_index = (parent_index-1)/2
    end

    if child.rating < grandpa.rating
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

  def delete(root, data)
  end

  def find(root, data)
  end

  def print(root)
    @node_array.each do |node|
      print node
    end

  end


end
