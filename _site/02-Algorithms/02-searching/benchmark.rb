require 'benchmark'
# require_relative '../fibonacci_iterative'
# require_relative 'fibonnaci_recursive'


Benchmark.bm(20) do |x|
  x.report("iterative fib 20 ") do

    def fib_iterative(n)
      if n== 0
        return 0
      end

      if n==1 || n==2
        return 1
      end
      count = 3
      number1 = 1
      number2 =1
       while count <=n
         temp = number1 + number2
         number1 = number2
         number2 = temp
        # puts temp
         count +=1
       end
       return temp
     end
     fib_iterative(20)

  end
  x.report("recursive fib 20 ") do

    def fib_recursive(n)
      if (n == 0)
        # #1
        return 0
      elsif (n == 1)
        # #2
        return 1
      else
        # #3
        return fib_recursive(n-1) + fib_recursive(n-2)
      end
    end
    fib_recursive(20)

  end
end
