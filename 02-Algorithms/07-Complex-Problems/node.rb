
class Node
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y
  attr_accessor :visited
  attr_accessor :city_distances
  attr_accessor :distance_from_me
  attr_accessor :just_the_distance
  attr_accessor :answer_array
  attr_accessor :hash_names_distance


  def initialize(name, x, y)
    @name = name
    @x = x   # holds x coordinate
    @y = y # holds y coordinate
    @visited = false #
    @hash_names_distance = Hash.new
  end

end
