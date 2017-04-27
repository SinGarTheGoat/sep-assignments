require 'benchmark'
#require_relative 'heap/array_nodes'
require_relative 'heap/heap-array'
require_relative 'binary_tree/binary_searchtree'

bert = Heap.new
# for(i=1;i>100000; i=i+1 ){
#    heap-array.bert.Node.new("this is node #{i}", i)
#
#    puts "#{i}"
# }
earny = BinarySearchTree.new
# for(i=1;i>100000; i=i+1 ){
#    Node.new("this is node #{i}", i)
#    puts "#{i}"
# }
benchmark.bm do |x|
  x.report("print BinarySearchTree") do
    i= 1
    for i in [100000]
       bert.Node.new("this is node #{i}", i)
       puts "#{i}"
       i=i+1
     end
  end
