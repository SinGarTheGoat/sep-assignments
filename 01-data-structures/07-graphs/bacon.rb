require_relative 'node'
require_relative 'answer_nodes'

class Bacon
  attr_reader :movie_array
  attr_accessor :starting_movie
  attr_accessor :starting_actor



  def initialize
    @movie_array = Array.new
    @answer_array = Array.new
    @zero_degree_movies = Array.new
    @zero_degree_actors = Array.new
    @starting_movie = nil
    @starting_actor = nil

  end

  def insert_movies_into_array(movie)
    @movie_array << movie
    @movie_array.last.cast.each do |acctor|
      if acctor == "Kevin Bacon"
      @zero_degree_movies << @movie_array.last
      @zero_degree_actors << @movie_array.last.cast
      #puts "just added #{@movie_array.last.movie} to @one_degree  "
      end
    end
    #puts "now inserting #{movie.movie}"
  end

  def find_the_input(film, actor)
    movie_counter = 0
    @movie_array.each {|node|
      if node.movie == film
        actor_count = 0
        moment_movie = @movie_array[movie_counter].movie
        #puts "found the movie #{@starting_movie}"

        @movie_array[movie_counter].cast.each {|possible_actor|
        #  puts "found our actor #{possible_actor}"
          if possible_actor == actor
            moment_actor = @movie_array[movie_counter].cast[actor_count]
          #  puts "found our actor #{@starting_actor} yaaaa"
            @answer_array << Node.new(moment_movie, moment_actor)
          #  puts "#{@answer_array.last.cast}     was in  #{@answer_array.last.movie}"
            check_zero_degrees(actor, film)
            find_da_bacon(moment_actor, moment_movie)
          end
          actor_count = actor_count+1
        }
      end
      movie_counter = movie_counter+1
    }
    puts "What the hell, I could not find #{actor} in #{film}"
    return false
  end

  def bacon_found
    @answer_array.each do |answer|
      puts "#{answer.cast} was in #{answer.movie} with "
      if answer == @answer_array.last
        puts "KEVIN MOTHERFUCKING BACON"
        return true
      end
    end
  end


  def check_zero_degrees(acctor, ffilm)

    @zero_degree_movies.each do |movie_node|

      if movie_node.movie == ffilm
        movie_node.cast.each do |cccast|
          if cccast == "Kevin Bacon"
            bacon_found
          end
        end
      end


    end
    #puts "we no hit, we go back"
  end

  def find_da_bacon(acctor, ffilm)
  #  print "we in find_da_bacon"
    #check_zero_degrees(acctor, ffilm)
  #  puts "aaaaaannnnnndddd we are back"
    @movie_array.each { |node|
      check_zero_degrees(node.cast, node.movie)
      unless node.movie == ffilm
        if node.cast.include?(acctor)
          temp_node = Node.new(node.movie, node.cast )
          unless @answer_array.include?(temp_node)
            @answer_array << Node.new(ffilm, acctor)
            next_cast_index = Random.rand(0..(node.cast.length - 1))
            puts "node.movie is  #{node.movie}"
            find_da_bacon(node.cast[next_cast_index], node.movie)
          end
        end


      end

      #visited_movies << node.movie
    }

  end




end
