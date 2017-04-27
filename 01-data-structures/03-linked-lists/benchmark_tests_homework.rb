require 'benchmark'
require_relative 'node'
require_relative 'linked_list'

test_0 = Array.new(10000)
bob = LinkedList.new(0)

n = 10000
Benchmark.bm do |x| #Compare the time it takes to create a 10,000 item Array to appending 10,000 items to a Linked List.
  x.report("Array insert") do
    for i in [0..10000]
      test_0.push("what up from #{i}")
    end
    puts test_0.length
    # Insert 10000 items into test_0
  end

  x.report("LinkedList insert") do
    for i in [0..10000]
      noode = Node.new("node #{i}")
      bob.add_to_tail(noode)
    end
    # Insert 10000 items into bob
  end
end

Benchmark.bm do |x|  #Compare the time it takes to access the 5000th element of the Array and the 5000th Node in the Linked List.
  x.report("acces 5000th element in Array") do
    puts test_0[4999]
  end
  x.report("acces 5000th node in LinkedList") do
    bob.return_at(4999)

    #puts bob.find_at(4999)  #create this method
    #how to I accesse a specfic node.
  end
end

Benchmark.bm do |x|   #Compare the time it takes to remove the 5000th element from the Array to removing the 5000th Node in the Linked List.
  x.report("delete 5000th element in Array") do

    test_0.delete_at(4999)
    # Insert 10000 items into test_0
  end

  x.report("delete 5000th node in LinkedList") do

    bob.delete_at(4999)  #(4999)  #create this method
    # Insert 10000 items into bob
  end
end
