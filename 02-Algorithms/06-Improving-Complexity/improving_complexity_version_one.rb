# This method takes n arrays as input and combine them in sorted ascending  order

 def poorly_written_ruby(*arrays)
   combined_array = []
   arrays.each do |array|   
    combined_array += array
    # #or use
    # combined_array.concat(array)
   end

   combined_array.sort! # big O of n^2

   combined_array
 end


p  poorly_written_ruby([2,3,5],[1,5,3],[9,4,2])
