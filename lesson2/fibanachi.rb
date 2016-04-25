fib = [1, 1]
fib << fib[-1] + fib[-2]
	fib << (fib[-1] + fib[-2]) while fib.last < 100 
fib.pop
p fib