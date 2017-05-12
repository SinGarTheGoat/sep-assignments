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
      if (find_index(actor_node.name) == nil)
        actors_to_add += 1
        actor_node.index = @actors_array.length
        @actors_array << actor_node
        actor_node.movies << name
        @matrix += [[0] * current_actors]
      else
        actor_index = find_index(actor_node.name)
        actors_array[actor_index].movies << name
      end
    end
    @matrix.each_with_index do |array, index|
      @matrix[index] = array + [0] * (actors_to_add)
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


end
