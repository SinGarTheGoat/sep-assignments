# This method takes n arrays as input and combine them in sorted ascending  order
#improves time complexity
def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
    # #or use
    # combined_array.concat(array)
  end



  return quicksort(combined_array)
  # Return the sorted array

end


def quicksort(array, from=0, to=nil)
  if to == nil
    # Sort the whole array, by default
    to = array.count - 1
  end

  if from >= to
    # Done sorting
    return array
  end

  # Take a pivot value, at the far left
  pivot = array[from]

  # Min and Max pointers
  min = from
  max = to

  # Current free slot
  free = min

  while min < max
    if free == min # Evaluate array[max]
      if array[max] <= pivot # Smaller than pivot, must move
        array[free] = array[max]
        min += 1
        free = max
      else
        max -= 1
      end
    elsif free == max # Evaluate array[min]
      if array[min] >= pivot # Bigger than pivot, must move
        array[free] = array[min]
        max -= 1
        free = min
      else
        min += 1
      end
    else
      raise "Inconsistent state"
    end
  end

  array[free] = pivot

  quicksort array, from, free - 1
  quicksort array, free + 1, to
end


p  poorly_written_ruby([2,3,5],[1,5,3],[9,4,2, 1])
