#
# @count = 0
# def search_recursive(collection, target)
#   puts "we have gone through #{@count} recursions"
#   @count +=1
#   if @count >50
#     puts "Faaaaack"
#     return
#   end
#
#   low = collection.first
#   high = collection.length
#   mid = low + high / 2
#   puts "low = #{low}"
#   puts "high = #{high}"
#   puts "mid = #{collection[mid]} and #{mid}"
#   puts "target = #{target}"
#
#   if collection[mid] > target
#     collection.slice!(mid+1,collection.length)
#     search_recursive(collection, target)
#   elsif collection[mid] < target
#     collection.slice!(low, mid-1,)
#     search_recursive(collection, target)
#   else
#     puts "target = #{target}"
#     puts "the target was #{collection[mid]} and it is index #{mid}"
#     return collection[mid]
#   end
# end
#
# ray = (1..10).to_a
# num = rand(10)
# puts "num = #{num}"
# puts ray
# puts search_recursive(ray, num)

# count = 0
# while count <=100
#   @count = 0
#   ray = (1...10).to_a
#   num = rand(10)
#   puts search_recursive(ray, num)
#   count +=1
#
# end


def recursive_bsearch(a, value)
  low, hi = get_limits(a)
  if low >= hi
    return false
  end
  mid = (low + hi) / 2
  if a[mid] == value
    mid
  elsif a[mid] < value
    recursive_bsearch(a[(mid+1)..hi], value)
  else
    recursive_bsearch(a[low..mid], value)
  end
end

def get_limits(a)
  [0, a.length - 1]
end

puts recursive_bsearch((1..10).to_a, rand(10))
