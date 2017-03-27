require_relative 'node'
class Heap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if root.left
      root.right = node
    else
      root.left = node
    end
  end

  def delete(root, data)
  end

  def find(root, data)
  end

  def print(root)
  end


end
