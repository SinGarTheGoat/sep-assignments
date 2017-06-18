class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :is_a_left
  attr_accessor :is_a_right

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
    @is_a_left = nil  #I need these to point to the indexes not the nodes.
    @is_a_right = nil
  end
end
