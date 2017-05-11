require 'benchmark'
#require_relative 'heap/array_nodes'
require_relative 'heap/heap-array'
require_relative 'binary_tree/binary_search_tree'

bert = Heap.new

root = Node.new("this is node 0", 0)
earny = BinarySearchTree.new(root)

Benchmark.bm(20) do |x|
  x.report("insert BinarySearchTree") do
    for i in 1..100
      if i == 50
        node =  Node.new("this is node 50", 50)
        earny.insert(root, node)
      else
        num =  Random.rand(1..100)
        node = Node.new("this is node #{num}", num)
        earny.insert(root, node)
      end
    end
  end
  x.report("insert heap") do
    for i in 1..10000
      if 1 == 50000
        node = Node.new("this is node 50000", 50000)
      else
      num =  Random.rand(1..10000)
      node = Node.new("this is node #{num}", num)
      bert.insert(node)
      end
    end
  end
end

Benchmark.bm(20) do |x|
  x.report("find  BinarySearchTree") do
    node =  Node.new("this is node 50", 50)
    # earny.printf
    # earny.print_node(Node.new("this is node 500", 500))
    earny.find(root, node)
  end

  x.report("find heap") do
    node =  Node.new("this is node 50000", 50000)
    bert.insert(node)
  end
end




Benchmark.bm(20) do |x|
  x.report("delete  BinarySearchTree 500th node") do
    node =  Node.new("this is node 50", 50)
    # earny.printf
    # earny.print_node(Node.new("this is node 500", 500))
    earny.delete(root, node)
  end

  x.report("delete heap") do
    node =  Node.new("this is node 50000", 50000)
    bert.delete(node)
  end
end
