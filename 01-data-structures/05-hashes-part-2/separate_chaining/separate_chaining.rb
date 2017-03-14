require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @max_load_factor = 0.7
    @inserts = 0
    @values = Array.new(size)
  end

  def []=(key, value) #this inserts new values into the hash
    target_index = index(key, @values.length)
    if @values[target_index]
      @values[target_index].add_to_tail(Node.new(key, value))
    else
      @values[target_index] = LinkedList.new
      @values[target_index].add_to_tail(Node.new(key, value))
    end
    @inserts += 1 #make sure it is a sucessful insertion
    puts load_factor
    if load_factor >= @max_load_factor    #need to get resize right to finish this
      puts '!!!'
      resize
    end


  end

  def [](key)
    target_index = index(key, @values.length)
    if @values[target_index]   #step through Linkrd list and return approprate key
      llist = @values[target_index]
      if llist
        node = llist.head
        while node && node.key != key do
          node = node.next
        end
        node && node.value
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total = 0
    key.each_byte { |c| total = c + total }
    total  % size   #its starting
  end

  # Calculate the current load factor
  def load_factor #load_factor = (number of hashes being stored in the hash / the number of buckets)
    @inserts.to_f / @values.length.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @values.length
  end

  # Resize the hash
  def resize #Doubles the array
    puts 'RESIZING'
    new_size = @values.length * 2
    new_array = Array.new(new_size)
    counter = 0
    @values.each{|linked_list|
      #go through each index of the array
      #each index is either nil or contins a linked list with one or more items
      #grab the key and value pair in each node and store it as a hash in an array
      #go through my array of hashes and send the key through the index method
      #set the key/value pair to the proper index in the array
      counter = 1 + counter
      if linked_list
        node = linked_list.head
        while node
          new_index = index(node.key, new_size)
          if new_array[new_index]
            new_array[new_index].add_to_tail Node.new(node.key, node.value)
          else
            new_array[new_index] = LinkedList.new
            new_array[new_index].add_to_tail Node.new(node.key, node.value)
          end
          node = node.next
        end
      end
    }
    @values = new_array
    puts @values.inspect
    puts @inserts
  end

end
