#found in the video https://www.youtube.com/watch?v=-9oC_XAVLBQ

class Array
  def quicksort
    return [] if empty?

    pivot = delete_at(rand(size))
    left ,right = partition(&pivot.method(:>))
    return *left.quicksort, pivot, *right.quicksort
  end

end
ray = (0..100).to_a
ray.shuffle!
print ray

print ray.quicksort
