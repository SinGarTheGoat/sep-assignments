require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor




  def initialize(size)
    @max_load_factor = 0.7
  end

  def []=(key, value)
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    total = 0
    key.each_byte do |c|
      total = c + total
    end
    total % size
  end

  # Calculate the current load factor
  def load_factor #load_factor = (number of hashes being stored in the hash / the number of buckets)
  end

  # Simple method to return the number of items in the hash
  def size

  end

  # Resize the hash
  def resize
  end
end
