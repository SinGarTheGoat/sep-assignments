# This method takes n arrays as input and combine them in sorted ascending  order
def poorly_written_ruby(*arrays)

  sorted_array = nil
  for array in arrays

    for val in array
      i = 0
      if sorted_array == nil    #one in here
        sorted_array = [array[0]]
        i=1
      end
      while i < sorted_array.length  #one in this loop
        if val <= sorted_array[i]
          sorted_array.insert(i, val)
          break
        elsif i == sorted_array.length - 1
          sorted_array << val
          break
        end
        i+=1
      end
    end
  end

  # Return the sorted array
  sorted_array
end

p  poorly_written_ruby([2,3,5],[1,5,3],[9,4,2])
