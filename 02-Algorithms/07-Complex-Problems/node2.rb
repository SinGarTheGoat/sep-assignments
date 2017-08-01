class Node2
attr_accessor :name
attr_accessor :distance #distance from city it is affilieated with through @city_distances array

#this node class is for city diatances
  def initialize(name, distance)
    @name = name
    @distance = distance
  end


end
