require_relative 'fode'

Class Shorttrip2

  def nearest_neighbor(graph_of_cities, current_city)





  end

  def add_city




  end

end
#
# DEF nearest possible neighbor(graph_of_cities, current_city)
#   WHILE current_city.visited IS FALSE
#     SET neighbor_cities TO current_city.neighbors
#     SET next_city = neighbor_cities[0]
#
#     FOR current_neighbor IN neighbor_cities
#       IF current_neighbor.distance < next_city.distance
#         ASSIGN current_neighbor TO next_city
#       END IF
#     END FOR
#     SET current_city.visited to TRUE
#     ASSIGN next_city TO current_city
#   END WHILE
# END DEF
