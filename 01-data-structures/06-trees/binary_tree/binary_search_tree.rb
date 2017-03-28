require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if node.rating >  root.rating #if node in tree is bigger than input node
      if root.right == nil  #if nil, we have found where to set it
        root.right = node
      else
        #route_node = route_node.right
        #if the branch was not nil reset route_node to route node.right and Recursively call insert
        insert(root.right, node)
      end
    else #if incoming node is bigger than node in tree
      if root.left == nil #if nil, we have found where to set it
        root.left = node
      else
        # route_node = route_node.left
          #if the branch was not nil reset route_node to route node.left and Recursively call insert
        insert(root.left, node)
      end
    end

  end

  # Recursive Depth First Search
  def find(root, data)

  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(root=nil)#   def printf(children=nil)
    if root == nil
      root = @root
    end
    node_array = []
    node_array.push(root)
    printf_breadth(node_array)
  end


def printf_breadth (node_array)
  if node_array.length >0
    root = node_array.shift
    print_node(root)
    if root.left != nil
      node_array.push(root.left)
    end
    if root.right != nil
      node_array.push(root.right)
    end
    printf_breadth(node_array)
  end
end

  def print_node(node)
    puts "#{node.title}: #{node.rating}"
  end
end
