require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix


  def initialize(width, height)
    self.width = width
    self.height = height
    @matrix =[]
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    if @matrix[x] == nil
       @matrix[x] = []
     end
    @matrix[x][y] = pixel

  end


   def at(x, y)
     inbounds(x,y)
     if @matrix[x] == nil || @matrix[x][y] == nil
       return nil
     end
     @matrix[x][y]
  end

  private

  def inbounds(x, y)
    if x>width || y>height||x<=0 || y<=0
      x = nil
      y= nil 
    return nil
    end
  end

end
