class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)# assigns values and keys
    index(key, size)
    #[key]value
  end

  def [](key) #retrives value from key

    
  end

  def resize
    #creat array
    #send every item through index
    #put items in new arry
    new_size = @items.length * 2
    newRay = Array.new(new_size)
    @items.each_with_index{|entry,index|
      newRay[index] = index(entry,new_size)
    }
    return newRay
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size) #take the asscii value % size to come up with index
    total = 0
    key.each_byte do |c|
      total = c + total
    end
    total % size

  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
