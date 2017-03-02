require_relative "hash_item"

class HashClass
  attr_reader :items

  def initialize(size)
    @items = Array.new(size)
  end



 
  def []=(key, value)# assigns values and keys
      #if value already exists
      #if nil than assign value
      #if different value its a collision and you
      #resize and insert again

      hash_item = @items[index(key, size)]

      if hash_item == nil

          hash_item = HashItem.new(key, value)
          @items[index(key, size)] = hash_item
      elsif value != hash_item.value
          resize()
          self[key]= value
      end

      #   @items[index(key, size())] = HashItem.new(key, value)
      #         #Im woundering if i need to itteriate over each index and look at each individual hash
      # if @items[] == @items.has_value?(value)  # value already exists  #If a collision occurs and the value to be inserted = existing value, ignore the insertion.
      #   return
      # elsif
      # end


  #  @items[index(key, size)] = HashItem.new(key, value)

  end

  def [](key) #retrives value from key
    index = index(key, size)

    if @items[index] == nil
      return
    else
      if  @items[index].key == key #2 keys in the same index
        @items[index].value
      end
    end




  end


  def resize
    #creat array
    #send every item through index
    #put items in new arry
    new_size = @items.length * 2
    newRay = Array.new(new_size)
    @items.each_with_index{|hash_item,index|
      if hash_item == nil
      else newRay[index(hash_item.key, new_size)] = hash_item
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
