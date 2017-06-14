def bucket_sort(array, num_buckets, bucket_size)
  buckets = Array.new(num_buckets){Array.new(0)}
  def sort_em_up(buckets, num, bucket_index)
    if buckets[bucket_index].empty? || num >= buckets[bucket_index].last
      buckets[bucket_index] << num
    else
      buckets[bucket_index].each.with_index do |num_in_array, index|
        if num <= num_in_array
          buckets[bucket_index].insert(index, num)
          break
        end
      end
    end
  end
  array.each do |num|
      # target_index = [buckets.length-1, [0, num-1].max / bucket_size].min
      try_index = [0, num - 1].max / bucket_size # limit num to >= 0, find an index to try
      target_index = [try_index, buckets.length - 1].min # don't go past the end of the array
      sort_em_up(buckets, num, target_index)
    end




  print buckets.flatten






end


ray = [2, 6, 3, 2, 1, 9, 8, 6, 6, 4, 4, 6, 2, 54, 22, 45, 32, 1, 12, 5, 5, 45, 64, 22, 5, 33, 43, 67, 35, 24, 54, 5]
# ray = (0...1001).to_a.shuffle
 j = (0...1001).to_a.shuffle
# rayj = ray << j
bucket_sort(ray, 5, 10)
