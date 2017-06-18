require_relative 'node'

class AdjMatrix
  attr_accessor :actors_array, :matrix, :film_hash

  def initialize(name)
    root = Node.new(name) #is initilized with desired actor when the matrix is created
    root.index = 0  #initializes index of root actor used to track place in actor array
    @actors_array = [root] #an array of all the actors in the matrix
    @matrix = [[0]] #creats matrix with the root node in the first index
    @film_hash = {} #creats a hash of movies with movie titles representing keys and the cast representing the cast
  end


#before a connection can be found the matrix must be created, each movie is loaded in via a hash

  def add_film(name, actors)


    actors_node_array = actors.map { |actor| Node.new(actor) } #creats an array of all actors in the movie being entered

    @film_hash[name] = actors #creates an entrie in the film hash for each movie passe in

    current_actors = @actors_array.length #how many actors we have in the matrix
    actors_to_add = 0

    actors_node_array.each do |actor_node| #itteriates over all the actors in movie being passed in
      if (find_index(actor_node.name) == nil) #checks if the actor is not in database
        actors_to_add += 1 #counts that a acor not in the matrix is being entered
        actor_node.index = @actors_array.length #initilizes the new actors unique place in the @actors_array
        @actors_array << actor_node #adds the new actor_node into the @actors_array
        actor_node.movies << name #tracks that the newly created actor node is connected with the movie
        @matrix += [[0] * current_actors] #expands matrix by number of new actors passed in
      else #if the actor is already in the matrix
        actor_index = find_index(actor_node.name) #locates the actor in the @actors_array
        actors_array[actor_index].movies << name  #Marks that the actor has appeared in the movie being passed in
      end
    end
    @matrix.each_with_index do |array, index| # Loops over each actor in the index and adds a zero for the new actor
      @matrix[index] = array + [0] * (actors_to_add)
    end

    actors_node_array.each do |actor_to_insert| #Each node being itteriated over is an actor in the film being entered
      @film_hash.each do |film, film_array|
        # If the actor is in a film, give association with every actor in that film
        if (film_array.index(actor_to_insert.name) != nil) #Checks every actor from film being entered against every films cast in matrix, if actor is in both block is excuted
          film_array.each do |actor| #itteriates over all actors in the film in the matrix to give them an association with actor from film being input into the matrix
            if (actor_to_insert.name == actor) #simply checks if actor is being compaired agsainst themselves to prevent giving an association to themselves
              next
            end
            actor_to_insert_index = find_index(actor_to_insert.name) #finds the index of the actor from the new film being inserted
            actor_index = find_index(actor)# finds the index of the actor they have an association with in a nother film, this is done to the entire cast
            matrix[actor_to_insert_index][actor_index] = 1 #assigns association to both actors
            matrix[actor_index][actor_to_insert_index] = 1
          end
        end
      end
    end
  end


  # idetifyes index of the actor in @actors_array
  def find_index(in_actor_name)
    @actors_array.each_with_index do |actor, index|
      if actor.name == in_actor_name
        return index
      end
    end
    return nil
  end

  def print_matrix
    @matrix.each do |row|
      index = @matrix.index(row)
        print "#{index}:  #{@actors_array[index].name}" + " " * (25 - @actors_array[index].name.length)
        puts (row.collect{|i| i.to_s}).join('  ')
    end
  end



  def find_kevin_bacon(actor_name)
    node_queue = [0]

    loop do
      curr_node = node_queue.pop

      return false if curr_node == nil
      # blog sez "this block goes from actor_name to himself."
      # e.g. bottom of the tree
      if curr_node == find_index(actor_name)
        node = @actors_array[curr_node]
        actors = [node.name]
        while (node.back_pointer != 0)
          actors << @actors_array[node.back_pointer].name
          node = @actors_array[node.back_pointer]
        end

        # add the man himself KB
        actors << @actors_array[0].name
        return_string = ""
        index = 0

        while (index < actors.length - 1)
          actor1 = actors[index]
          actor2 = actors[index + 1]
          common_movie = find_common_movie(actor1, actor2)
          string = "#{actor1} acted in #{common_movie} with #{actor2}\n"
          return_string += string
          index += 1
        end
        return return_string
      end

      # this block is for everything else
      matrix_size = @matrix.length
      children = (0..matrix_size-1).to_a.select do |i|
        @matrix[curr_node][i] == 1
      end

      children.each do |child|
        unless @actors_array[child].visited
          @actors_array[child].back_pointer = curr_node
          @actors_array[child].visited = true
        end
      end

      node_queue = children + node_queue

    end
  end




  def find_common_movie(actor1, actor2)
    actor1_index = find_index(actor1)
    actor2_index = find_index(actor2)

    actor1_node = @actors_array[actor1_index]
    actor2_node = @actors_array[actor2_index]

    actor1_node.movies.each do |movie|
      if actor2_node.movies.index(movie) != nil
        return movie
      end
    end
  end









end
