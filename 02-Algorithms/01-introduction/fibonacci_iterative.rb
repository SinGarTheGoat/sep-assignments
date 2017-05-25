def fib(n)
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

 puts fib(0)
 puts fib(1)
 puts fib(2)
 puts fib(3)
 puts fib(4)
 puts fib(5)
 puts fib(6)
 puts fib(7)
 puts fib(8)
 puts fib(9)
