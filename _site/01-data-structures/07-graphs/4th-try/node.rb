class Node #represents an actor
  attr_accessor :index, :name, :visited, :back_pointer, :movies

  def initialize(name)
    @name = name #the actor at center of matrix
    @visited = false #determins if actors connection has been checked
    @index = nil   #tracks the actors place in the @actors_array
    @movies = []  # all the movies actor has been in.
  end
end
