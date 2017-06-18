require_relative 'node'

class OpenAddressing
  def initialize(size)
    @values = Array.new(size)
  end

  def []=(key, value)
    #puts "here? did we get here?"
    target_index = index(key, @values.length)
    start = target_index
    while @values[target_index] != nil do #do as long as somthing is in the target index
      if  start == (target_index - 1) % @values.length
        resize() #to be written
        target_index = index(key, @values.length)
        start = target_index
      elsif target_index == (@values.length-1)
        target_index = 0
      else
        target_index = target_index+1
      end
    end
    @values[target_index] = Node.new(key, value)
  end

  def [](key)
    target_index = index(key, @values.length)
    start = target_index
    while @values[target_index].key != key do #do as long as somthing is in the target index
      if  start ==  (target_index - 1) % @values.length
        return  nil #  "Pepe god of chaos Trump 2016"
      elsif target_index == (@values.length-1)
        target_index = 0
      else
        target_index = target_index+1
      end
    end
    return @values[target_index].value

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total = 0
    key.each_byte { |c| total = c + total }
    total  % size   #its starting
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @values.size
  end

  # Resize the hash
  def resize
    new_size = @values.length * 2
    new_array = Array.new(new_size)
    @values.each do |dickbutt|
      if dickbutt
        new_array[index(dickbutt.key, new_size)] = dickbutt#Node.new(dickbutt.key, dickbutt.value)
      end
    @values = new_array


    end
  end
end
