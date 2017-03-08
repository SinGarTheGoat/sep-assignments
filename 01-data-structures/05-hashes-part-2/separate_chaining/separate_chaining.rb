require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor
  attr_reader :ray_o_lists



  def initialize(size)
    @max_load_factor = 0.7
    @inserts = 0
    @values = Array.new(size)
  end

  def []=(key, value) #this inserts new values into the hash
    target_index = index(key, key.length)

    if @values[target_index]
      @values[target_index].add_to_tail(Node.new(key, value))
      else
        @values[target_index] = LinkedList.new
        @values[target_index].add_to_tail(Node.new(key, value))
    end


    # unless @values[target_index]   #nothing in the index
    #     @values[target_index] = LinkedList.new
    # end
    # @values[target_index].add_to_tail(Node.new(key, value))
    #


    @inserts += 1 #make sure it is a sucessful insertion
  end

  def [](key)
    target_index = index(key, key.length)
    if @values[target_index]   #step through Linkrd list and return approprate key
      node = @values[target_index].head
      while  node && node.key != key do
        node = node.next
      end
      node && node.value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total = 0
    key.each_byte do |c|
      total = c + total
    end
    total  % size   #its starting
  end

  # Calculate the current load factor
  def load_factor #load_factor = (number of hashes being stored in the hash / the number of buckets)
    # puts @inserts
    # puts @values.length
    # puts "next"
    load_fak = ((@inserts).to_f/(@values.length).to_f)

    if load_fak >= @max_load_factor    #need to get resize right to finish this
      resize()
      load_factor()
    end
    load_fak
  end

  # Simple method to return the number of items in the hash
  def size
    #puts @values.inspect
    @values.length
  end

  # Resize the hash
  def resize #Doubles the array
    new_size = @values.length * 2
    new_ray = Array.new(new_size)
    puts "just got into resize  "
    puts @values.size
    # @values.each{|indice|
    #   puts indice.inspect
    #
    # }
    # puts "done with first looping"
    @values.each{|linked_list|
      #go through each index of the array
      #each index is either nil or contins a linked list with one or more items
      #grab the key and value pair in each node and store it as a hash in an array
      #go through my array of hashes and send the key through the index method
      #set the key/value pair to the proper index in the array

      puts "looping through values"

      unless linked_list.nil?
        puts "found a linked_list"

        current = linked_list.head
        new_ray[index(current.key, new_size)] = Node.new(current.key, current.value)
        unless current.next.nil?
          puts "has a next"
          while current.next != nil
            puts "has more next"
            current = current.next
            puts current.key

            new_ray[index(current.key, new_size)] = Node.new(current.key, current.value)
        #puts  linked_list.head.key
        #take each index of the array (each with 1 node linked list and )
          end
          new_ray[index(current.key, new_size)] = Node.new(current.key, current.value)

        end
      end

    }
    @values = new_ray
    new_ray.each{|indice|
      puts indice.inspect

    }
    puts "new"

  end
end
