class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
    #where as the last one i did only had data on the
    #node this has both.

    @key = key
    @value = value
    @next = nil


    
  end
end
