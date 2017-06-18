require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heapsort'
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
    #puts "shuffeled_array.length= #{shuffeled_array}"
    a = shuffeled_array
    #puts "a.length= #{a.length}"
    hello_array = []
    pile_o_shhh = Heapsort.new
    for i in 0..a.length - 1
      hello = (0...8).map { (65 + rand(26)).chr }.join
      hello_array << hello
      #puts "hello_array.length= #{hello_array.length} "
      #puts b.last.title
    end
    hello_array.each do |x|
      temp = Node.new(x, a.pop)
        #puts "#{temp.title} #{temp.rating}"
      pile_o_shhh.insert(temp)
    end
    pile_o_shhh.sorted_list

    # while the heap has something
    #   new array << heap.pop
  end

end
