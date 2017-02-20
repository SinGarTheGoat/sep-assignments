class HashClass

  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)# assigns values and keys
      #if value already exists
      #if nil than assign value
      #if different value its a collision and you
      #resize and insert again
      

    @items[index(key, size)] = value
    #HashclassObject[key] = value
  end

  def [](key) #retrives value from key
     @items[index(key, @items.length)]

  end

  def resize
    #creat array
    #send every item through index
    #put items in new arry
    new_size = @items.length * 2
    newRay = Array.new(new_size)
    @items.each_with_index{|entry,index|
      if entry == nil
      else newRay[index] = entry
    end
    }
    @items = newRay
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
