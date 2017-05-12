require_relative 'nodetwo'

class Bacontwo
  attr_accessor :movie_array
  attr_accessor :zero_degree_movies
  attr_accessor :zero_degree_cast


  def initialize
    @movie_nodes = []   #contains the whole nodes of both title and cast in an array
    @whole_cast = []
    @movie_titles = []

    @zero_degree_nodes = []
    @zero_degree_titles = []
    @zero_degree_cast = []

    @answer_array = []
  end

  def insert_movies_into_array(movie_node)
    @movie_nodes << movie_node          #insert each node into on answer_array
    @movie_titles << movie_node.title         #An array of all movie titles
    movie_node.cast.each do |cast_member|    #an array of the entire cast
      @whole_cast << cast_member
    end
    if movie_node.cast.include?("Kevin Bacon") #does the same as above but for movies kevin bacon was in
      @zero_degree_nodes << movie_node

      @zero_degree_titles << movie_node.title
      movie_node.cast.each do |cast_member|
        @zero_degree_cast << cast_member
      end
    end
  end


  def find_the_input(movie, actor)
    movie_there(movie)
    @movie_nodes.each do |node|
      if node.title == movie
        node.cast.each do |possible_actor|
          if possible_actor == actor
            @answer_array << Node.new(movie, actor)  # we good through here and all this other stuff is just checks
            find_da_bacon(movie, actor)
            puts "we are past find the bacon"
          end
        end
         if @answer_array.empty?
           puts "according to my database #{actor} was not in #{movie}"
           return false
         end
      end
    end
  end

  def movie_there(movie)
    unless @movie_titles.include?(movie)
      puts "#{movie} is not in my database"
      return false
    end
  end

  def find_da_bacon(movie, actor)
    temp_node =  Node.new(movie, actor)
    unless @answer_array.title.include?(movie) && @answer_array.cast.include?(actor)
      @answer_array << temp_node
    end
    puts "wezzzz here"

    if @zero_degree_titles.include?(movie)
      @zero_degree_nodes.each do |node|
        if node.title == movie
          node.cast.each do |possible_actor|
            if possible_actor == actor
              @answer_array << Node.new(movie, actor)
              out_put_answer     # We should stop after this method runs
            end
          end
        end
      end
    end

    @movie_nodes.each do |node|
      if node.title == movie
        node.cast.each do |possible_actor|
          unless @answer_array.title.include?(node.title)  &&   @answer_array.cast.include?(possible_actor) #checks to make sure the node has not been entered
            if @zero_degree_cast.include?(possible_actor)
              @answer_array << Node.new(node.title, possible_actor)
              @zero_degree_nodes.each do |node|
                if node.cast.include?(possible_actor)
                  find_da_bacon(node.title, possible_actor)
                end
              end
            end
          end

        end
      end
    end





  end


  def out_put_answer   # We should stop after this method runs
    @answer_array.each do |answer_node|
      puts "#{answer_node.cast} was in #{answer_node.title}"
    end
    puts "with Kevin MOTHERFUCKING Bacon"
  end

end
