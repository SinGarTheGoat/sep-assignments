require_relative 'node'

class Bacon

  attr_accessor :movie_array
  attr_accessor :zero_degree_movies
  attr_accessor :zero_degree_cast

  def initialize
    @movie_nodes = []   #contains the whole nodes of both title and cast in an array
    @answer_array = []


  end


    def insert_movies_into_array(movie_node)
      @movie_nodes << movie_node



    end



end
