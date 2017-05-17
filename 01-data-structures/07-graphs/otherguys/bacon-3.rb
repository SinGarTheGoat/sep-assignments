require_relative 'node3'

class AdjMatrix
  attr_accessor :actors_array, :matrix, :film_hash

  def initialize(name)
    root = Node.new(name)
    root.index = 0
    @actors_array = [root]
    @matrix = [[0]]
    @film_hash = {}
  end




  def add_film(name, actors)
    actors_node_array = actors.map { |actor| Node.new(actor) }
    @film_hash[name] = actors
    current_actors = @actors_array.length #how many actors we have in the matrix
    actors_to_add = 0

    actors_node_array.each do |actor_node|
      if (find_index(actor_node.name) == nil) #if the actor is not in database
        actors_to_add += 1
        actor_node.index = @actors_array.length
        @actors_array << actor_node
        actor_node.movies << name
        @matrix += [[0] * current_actors]
      else
        actor_index = find_index(actor_node.name)
        actors_array[actor_index].movies << name  #im a little unclear on this line
      end
    end
    @matrix.each_with_index do |array, index|
      @matrix[index] = array + [0] * (actors_to_add)  #im a little unclear on this line
    end

    actors_node_array.each do |actor_to_insert|
      @film_hash.each do |film, film_array|
        # If the actor is in a film, give association with every actor in that film
        if (film_array.index(actor_to_insert.name) != nil)
          film_array.each do |actor|
            if (actor_to_insert.name == actor)
              next
            end
            actor_to_insert_index = find_index(actor_to_insert.name)
            actor_index = find_index(actor)
            matrix[actor_to_insert_index][actor_index] = 1
            matrix[actor_index][actor_to_insert_index] = 1
          end
        end
      end
    end
  end


  def find_index(actor_name)
    current_index = 0
    actor_found = false
    while (current_index < @actors_array.length)
      if (actor_name == @actors_array[current_index].name)
        actor_found = true
        break
      end
      current_index += 1
    end

    return actor_found ? current_index : nil

  end

  def print_matrix
    @matrix.each do |row|
      index = @matrix.index(row)
      if index < 10
        print "#{index}:  #{@actors_array[index].name}" + " " * (25 - @actors_array[index].name.length)
      else
        print "#{index}: #{@actors_array[index].name}" + " " * (25 - @actors_array[index].name.length)
      end
      puts (row.collect{|i| i.to_s}).join('  ')
    end
  end


  def find_kevin_bacon(actor_name)
    node_queue = [0]

    loop do
      curr_node = node_queue.pop

      return false if curr_node == nil
      if curr_node == find_index(actor_name)
        node = @actors_array[curr_node]
        actors = [node.name]
        while (node.back_pointer != 0)
          actors << @actors_array[node.back_pointer].name
          node = @actors_array[node.back_pointer]
        end

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
      matrix_size = @matrix.length
      children = (0..matrix_size-1).to_a.select do |i|
        @matrix[curr_node][i] == 1
      end

      children.each do |child|
        unless @actors_array[child].visited == true
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
