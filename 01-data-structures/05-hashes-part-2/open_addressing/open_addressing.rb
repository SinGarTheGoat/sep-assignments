require_relative 'node'

class OpenAddressing
  def initialize(size)
    @values = Array.new(size)
  end

  def []=(key, value)
    target_index = index(key, @values.length)


  end

  def [](key)
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
  end

  # Simple method to return the number of items in the hash
  def size
    @values.size
  end

  # Resize the hash
  def resize
  end
end
