class Heap
  attr_accessor :array_rep  #:heap_size,
  def initialize
    @array_rep = Array.new
    @final_list =Array.new
  end



  def left_child(index)
    2*index + 1
  end

  def right_child(index)
    2*index + 2
  end

  def left_child_key(index)
    @array_rep[left_child(index)]
  end

  def right_child_key(index)
    @array_rep[right_child(index)]
  end


  def leaf_node?(index)
    return index >= (@array_rep.length-1)/2
  end

  def satisfied?(index)
    @array_rep[index] >= left_child_key(index) and
    @array_rep[index] >= right_child_key(index)
  end

  def fix_one_error(index)
    return if leaf_node?(index) || satisfied?(index)

    left_child_key = @array_rep[left_child(index)]
    right_child_key = @array_rep[right_child(index)]

    larger_child = if left_child_key > right_child_key then left_child(index)
    else right_child(index) end

      @array_rep[index], @array_rep[larger_child] = @array_rep[larger_child],
      @array_rep[index]

      fix_one_error(larger_child)
    end

    def insert(number)
      @array_rep.unshift(number)
      fix_one_error(0)
    end

    def get_max
      array_rep[0]
    end

    def sorted_list
      until @array_rep[0] == nil do
        shifted = @array_rep.shift
        popped = @array_rep.pop
        @array_rep.unshift(popped)
        @final_list << shifted
        fix_one_error(0)
      end
      return @final_list
    end

  end


  # heep = Heap.new
  #
  # ray=(1..50).to_a.shuffle!
  # ray.each do |number|
  #   #puts "inserting #{number}"
  #   heep.insert(number)
  #   p heep.array_rep
  # end
  # p heep.array_rep
  # puts "ya done son"
  # p heep.sorted_list
