class Bucket
  def bucket_sort(array, num_buckets, bucket_size)
    buckets = Array.new(num_buckets){Array.new(0)}

    def sort_em_up(buckets, num, bucket_index)
      if buckets[bucket_index].empty? || num >= buckets[bucket_index].last
        #puts "num= #{num} & bucket_index= #{bucket_index} "
        buckets[bucket_index] << num
      else
        buckets[bucket_index].each.with_index do |num_in_array, index|
          if num <= num_in_array
            #puts "num= #{num} & bucket_index= #{bucket_index} "
            buckets[bucket_index].insert(index, num)
            break
          end
        end
      end
    end

    array.each do |num| #cycle through each number in arra
      try_index = [0, num - 1].max / bucket_size  #assuming I did not pass in a negitive number .max produces num-1 then devides it by bucket_size   # limit num to >= 0, find an index to try
      target_index = [try_index, buckets.length - 1].min #if the number was still larger than buckets.length - 1  we simply choose the last bucket # don't go past the end of the array
      sort_em_up(buckets, num, target_index)# we pass the numbers to our sorting function
    end
    #print buckets.flatten
  end

end
# ray = [14,13,17,16,15,30,31,2, 6, 3, 2, 1, 9, 8, 6, 6, 4, 4, 6, 2, 54, 22, 45,-5, 32, 1, 12, 5, 5, 45, 64, 22, 5, 33, 43, 67, 35, 24, 54]
# # ray = (0...1001).to_a.shuffle
# j = (0...50).to_a.shuffle!
# rayj = ray + j
# #puts "#{rayj}"
# bucket_sort(rayj, 10, 15)
#

#
# array.each do |num| #we cycle through each number in array
#     # target_index = [buckets.length-1, [0, num-1].max / bucket_size].min
#     try_index = [0, num - 1].max / bucket_size        # limit num to >= 0, find an index to try
#     target_index = [try_index, buckets.length - 1].min # don't go past the end of the array
#     sort_em_up(buckets, num, target_index)
#   end
