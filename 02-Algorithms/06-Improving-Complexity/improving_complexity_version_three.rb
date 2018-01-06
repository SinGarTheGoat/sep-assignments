# This method takes n arrays as input and combine them in sorted ascending  order
#improves space complexity
def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
   combined_array += array
   # #or use
   # combined_array.concat(array)
  end

  return sort(combined_array)
end
# can't be improved in an asymptotic sense because you are returning n and it will always increase with N

#Used selection sort

def sort(collection)
  length = collection.length
  for outter_index in 0..length-2
    min_index = outter_index
    for inner_index in (outter_index+1)...length
      if collection[inner_index] < collection[min_index]
        min_index = inner_index
      end
    end
    collection[outter_index], collection[min_index] = collection[min_index], collection[outter_index]

  end

  collection
end

p  poorly_written_ruby([2,3,5],[1,5,3],[9,4,2])
