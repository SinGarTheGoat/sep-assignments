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

  def insert(root, node)
    if node.rating >  root.rating #ifinput node is bigger than node in tree
      if root.right == nil  #if nil, we have found where to set it
        root.right = node
      else
        #route_node = route_node.right
        #if the branch was not nil reset route_node to route node.right and Recursively call insert
        insert(root.right, node)
      end
    else #if incoming node is smaller than node in tree
      if root.left == nil #if nil, we have found where to set it
        root.left = node
      else
        # route_node = route_node.left
          #if the branch was not nil reset route_node to route node.left and Recursively call insert
        insert(root.left, node)
      end
    end
  end


  #Recursive Depth First Search
  def find(root, data)
    node_stack= []
    node_stack.push(root)
    find_depth(node_stack, data)
  end

  def find_depth(node_stack, data, parent=nil)
    puts node_stack.inspect
    return nil if node_stack.empty? || data == nil
    now_serving = node_stack.pop
    if now_serving.title == data
      puts "#{now_serving}= data and it should end"
      now_serving.parent = parent
      return now_serving
    else
      if now_serving && now_serving.right  #Check if node has a right node property
        node_stack.push(now_serving.right)#if so add it to stack
        puts "we got one to the right"
      end
      if now_serving && now_serving.left #Check if node has a left node property
        node_stack.push(now_serving.left)#if so add it to stack
        puts "we got one to the left"
      end
      find_depth(node_stack, data, now_serving)

    end
  end




  def delete(root, data)
    return nil if !data
    target = find(root, data)
    if !(target.left || target.right)
      parent = target.parent
      if parent.left == target
        parent.left = nil
      else
        parent.right = nil
      end
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
