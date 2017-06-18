require 'benchmark'
require_relative 'bucket_sort'
require_relative 'heapsort'
require_relative 'quicksort'

shuffeled_array = (1..50).to_a.shuffle!
puts shuffeled_array.length

Benchmark.bm(14) do |x|

  x.report('.sort!') do |x|
    sa = shuffeled_array
    sa.sort!
  end

  x.report('bucket sort') do
    muck = Bucket.new
    bucket_array = shuffeled_array
    num_buckets = 5
    bucket_size = 10
    muck.bucket_sort(bucket_array, num_buckets, bucket_size)
  end

  x.report('quicksort') do |x|
    flash = shuffeled_array
    flash.quicksort
  end

  x.report('heap') do
    a = shuffeled_array
    puts a.length
    hello_array = []
    pile_o_shhh = Heapsort.new
    for i in 0..a.length - 1
      hello = (0...8).map { (65 + rand(26)).chr }.join
      hello_array << hello
      #puts b.last.title
    end
    # hello_array.each do |x|
    #   temp = Node.new(x, a.pop)
    #   #  puts "#{temp.title} #{temp.rating}"
    #   pile_o_shhh.insert(temp)
    # end
    # pile_o_shhh.sorted_list

    # while the heap has something
    #   new array << heap.pop
  end

end
#
# Benchmark.bm('heapsort') do |x|
#   x.report { for i in 1..n; a = "1"; end }
#   x.report { n.times do   ; a = "1"; end }
#   x.report { 1.upto(n) do ; a = "1"; end }
# end
#
# Benchmark.bm('quicksort') do |x|
#   x.report { for i in 1..n; a = "1"; end }
#   x.report { n.times do   ; a = "1"; end }
#   x.report { 1.upto(n) do ; a = "1"; end }
# end
