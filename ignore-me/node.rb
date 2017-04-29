class Node
  attr_accessor :name
  attr_accessor :film_actor_hash

  def initialize(name, film_actor_hash)
    @name = name
    @movie = Array.new
  end

end
