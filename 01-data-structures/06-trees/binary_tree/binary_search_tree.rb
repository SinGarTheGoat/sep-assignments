require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
  #   route_node = root
  #   if route_node.rating > node.rating #if node in tree is bigger than input node
  #     if route_node.right == nil  #if nil, we have found where to set it
  #       route_node.right = node
  #     else
  #       route_node = route_node.right
  #       #if the branch was not nil reset route_node to route node.right and Recursively call insert
  #       insert(route_node, node)
  #     end
  #   else #if incoming node is bigger than node in tree
  #     if route_node.left == nil #if nil, we have found where to set it
  #       route_node.left = node
  #     else
  #       route_node = route_node.left
  #         #if the branch was not nil reset route_node to route node.left and Recursively call insert
  #       insert(route_node, node)
  #     end
  #   end
  # end


    if node.rating > root.rating  #If the rating of the incoming node is grater than the root
      root.right = node
    else  #If the root rating is grater than the node
      root.left = node
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end
end
