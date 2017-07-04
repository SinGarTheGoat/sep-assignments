require 'benchmark'
require_relative 'bucket_sort'
require_relative 'thirdheap'
require_relative 'quicksort'

#shuffeled_array = (1..50).to_a.shuffle!
#puts shuffeled_array.length

Benchmark.bm(14) do |x|

  x.report('.sort!') do |x|
    shuffeled_array = (1..50).to_a.shuffle!
    sa = shuffeled_array
    sa.sort!
  end

  x.report('bucket sort') do
    muck = Bucket.new
    shuffeled_array = (1..50).to_a.shuffle!
    bucket_array = shuffeled_array
    num_buckets = 5
    bucket_size = 10
    muck.bucket_sort(bucket_array, num_buckets, bucket_size)
  end

  x.report('quicksort') do |x|
    shuffeled_array = (1..50).to_a.shuffle!
    flash = shuffeled_array
    flash.quicksort
  end

  x.report('heap') do
    shuffeled_array = (1..50).to_a.shuffle!

    pile_o_shhh = Heap.new


    shuffeled_array.each do |x|
        pile_o_shhh.insert(x)
      #puts   "#{temp.title} #{temp.rating}"
        #puts pile_o_shhh.heap_array
    end
    p pile_o_shhh.sorted_list
    puts "ya done son!"
    #pile_o_shhh.sorted_list

    # while the heap has something
    #   new array << heap.pop

    #
    # class Array
    #   def heapsort!
    #     #heapify
    #     1.upto(self.length - 1) do |i|
    #       #move up
    #       child = i
    #       while child > 0
    #         parent = (child - 1) / 2
    #         if self[parent] < self[child]
    #           self[parent], self[child] = self[child], self[parent]
    #           child = parent
    #         else
    #           break
    #         end
    #       end
    #     end
    #
    #     #sort
    #     i = self.length - 1
    #     while i > 0
    #       self[0], self[i] = self[i], self[0]
    #       i -= 1
    #
    #       #move down
    #       parent = 0
    #       while parent * 2 + 1 <= i
    #         child = parent * 2 + 1
    #         if child < i && self[child] < self[child + 1]
    #           child += 1
    #         end
    #         if self[parent] < self[child]
    #           self[parent], self[child] = self[child], self[parent]
    #           parent = child
    #         else
    #           break
    #         end
    #       end
    #     end
    #   end
    # end

    #
    # p shuffeled_array
    # shuffeled_array.heapsort!
    # p shuffeled_array







  end

end
