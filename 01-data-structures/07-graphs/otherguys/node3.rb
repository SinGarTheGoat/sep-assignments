class Node
  attr_accessor :index, :name, :visited, :back_pointer, :movies

  def initialize(name)
    @name = name
    @visited = false
    @index = nil
    @movies = []
  end
end

 
