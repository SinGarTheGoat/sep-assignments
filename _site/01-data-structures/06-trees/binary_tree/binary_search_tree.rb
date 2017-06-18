require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    # @eximaned_node = nil
    # @been_in_stack = []
     #@node_stack = []
     #@find_truth = false
     @counter = true
  end


  def insert(node)
    insert_internal(@root, node)
  end

  def insert_internal(root, node)
    if node.rating >  root.rating #ifinput node is bigger than node in tree
      if root.right == nil  #if nil, we have found where to set it
        root.right = node
      else
        #route_node = route_node.right
        #if the branch was not nil reset route_node to route node.right and Recursively call insert
        insert_internal(root.right, node)
      end
    else #if incoming node is smaller than node in tree
      if root.left == nil #if nil, we have found where to set it
        root.left = node
      else
        # route_node = route_node.left
          #if the branch was not nil reset route_node to route node.left and Recursively call insert
        insert_internal(root.left, node)
      end
    end
  end


  #Recursive Depth First Search
  def find(rating)
    find_depth(rating, @root)
  end

  def find_depth(goal_rating, node)


    if goal_rating == nil || goal_rating <= 0
      puts "that rating is invalid"
      return nil
    end
    if node == nil || node.rating == goal_rating
      return node
    elsif goal_rating < node.rating
      return find_depth(goal_rating, node.left)
    else
      return find_depth(goal_rating, node.right)
    end


  end




  def delete(root, data)
    return nil if !data
    target = find(data)
    if !(target.left || target.right) #no chrildren
      if @root.rating = data
        @root = nil
        return
      end
      parent = target.parent
      if parent.left == target
        parent.left = nil
        return
      else
        parent.right = nil
      end
    elsif !(target.left && target.right)
      random_num = rand(100)
      if random_num.even?
        predicesor(target)
      else
        sucessor(target)
      end
    else

    end

  end

  def predicesor(target)
    target = target.left
    while target.right != nil
      target = target.right
    end
  end

  def sucessor(target)
    target = target.right
    while target.left != nil
      target = target.left
    end
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
    if node_array.length > 0
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
