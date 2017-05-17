require_relative 'node'

class Bacon
  attr_accessor :movie_array
  attr_accessor :zero_degree_nodes
  attr_accessor :zero_degree_cast
  attr_accessor :zero_degree_movies
  attr_accessor :answer_array

  def initialize
    @movie_array = []
    @answer_array = []


    @zero_degree_nodes =[]
    @zero_degree_cast= []
    @zero_degree_movies =[]
  end


  def insert_movies_into_array(movie_node)
    @movie_array << movie_node
    if movie_node.cast.any?{|possible_actor| possible_actor == "Kevin Bacon" }
      @zero_degree_nodes << movie_node
      @zero_degree_movies << movie_node.movie
      @zero_degree_cast << movie_node.cast
    end
  end

  def make_node(movie, actor)
    @answer_array << Node.new(movie, actor)

  end

  def print_answer
    @answer_array.each do |node|
      puts " #{node.cast} was in #{node.movie}"
    end
    puts "with Kevin MOTHERFUCKING Bacon"

  end

  def find_the_input(movie, actor)
    unless @movie_array.any?{|movie_node| movie_node.movie == movie }
      puts "i do not have #{movie} in my database"
      return false
    end
    @movie_array.each do |movie_node|  #locate/ find movie & actor
      if movie_node.movie == movie
        movie_node.cast.each do |possible_actor|
          if possible_actor == actor
          #starting_node = make_node(movie, actor)

          make_node(movie, actor)
          puts "actor #{actor} found in #{movie} "
          find_da_bacon(@answer_array[0])
          end
        end
      puts "i did not find #{actor} in #{movie} "
      end
    end
  puts "#{@answer_array.size}"
  ##find_da_bacon(@answer_array[0])
  end

 def find_da_bacon(actor_node)


  end


  def zero_degree(actor_node)
    puts "in zero"


  end

end
