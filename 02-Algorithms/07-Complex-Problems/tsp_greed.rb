require_relative 'node'
require_relative 'node2'
class Shorttrip

  def initialize
    @city_array = []
    @da_winner = Node2.new("place holder", 99999.9999)

  end

  def add_city(city)
    @city_array.each do |place| #compair the distance between the new city and every city in the array, then set
      distannce_from_the_2 = Math.sqrt((place.x - city.x)**2+(place.y - city.y)**2)
      place.hash_names_distance[city.name] = distannce_from_the_2
      city.hash_names_distance[place.name] = distannce_from_the_2
      puts "distance from #{city.name} to #{@city_array.first.name} is #{city.hash_names_distance[@city_array.first.name]}"

    end
    @city_array << city
  end

  def n_n(city_node)

    answer_array = []
    while city_node != nil
      city_node.visited = TRUE
      next_city =nil
      min_distance =  Float::INFINITY
      for city in @city_array

        puts " city.name = #{city.name} city_node.name = #{city_node.name} city.hash_names_distance[city_node.name] = #{city.hash_names_distance[city_node.name]}"
        if  city.visited == false && city.hash_names_distance[city_node.name] < min_distance
          next_city = city
          min_distance =  city.hash_names_distance[city_node.name]
        end
      end
      answer_array << city_node
      puts "I'm in #{answer_array.last.name}"
      city_node = next_city
    end
    return answer_array
  end
end
