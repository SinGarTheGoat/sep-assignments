require_relative 'heapsort'

class Node
  attr_accessor :title
  attr_accessor :rating
  def initialize(title, rating)
    @title = title
    @rating = rating
  end
end

a =(0...50).to_a.shuffle
b = []
heap_o_shh = Heapsort.new


for i in 0..49
  hello = (0...8).map { (65 + rand(26)).chr }.join
  temp = Node.new(hello, a.pop)
  heap_o_shh.insert(temp)
  b << temp
  #puts b.last.title
end

heap_o_shh.heap_array.each do |x|
   puts "#{x.title} #{x.rating}"

end
