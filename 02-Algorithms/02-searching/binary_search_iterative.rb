


def binary_search(array, target)
  low = 0
  high = array.length - 1
  found = false

  while low <= high
    mid = (low+high)/2
    if array[mid] > target
      high = mid-1
    elsif array[mid] < target
      low = mid +1
    else
      puts "target = #{target}"
      puts "the target was #{array[mid]} and it is index #{mid}"
      return array[mid]
    end
  end


end


ray = (1...101).to_a
num = rand(100)
puts binary_search(ray, num)
count = 0
while count <=100
  ray = (1...101).to_a
  num = rand(100)
  puts binary_search(ray, num)
  count +=1

end


#puts binary_search(ray, 49)
