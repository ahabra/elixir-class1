defmodule Simple do


	def doubleList(list) do
		Enum.map(list, fn(x)-> x*2 end)

		# or a simpler syntax: &1 means 1st argument
		#Enum.map(list, &1 * 2)
	end

	# notice the pattern matching on function arguments
	def sumList(list), do: sumList(list, 0)
	def sumList([], total), do: total
	def sumList([head|tail], total), do: sumList(tail, head+total)
	
	def factorial(n) when n< 0, do: 0  # notice the 'when' guard
	def factorial(n) when n< 3, do: n
	def factorial(n), do: n*factorial(n-1)
	
	def fibonacci(0), do: 0
	def fibonacci(1), do: 1
	def fibonacci(n) when n>1, do: fibonacci(n-1) + fibonacci(n-2)
	# TODO support -ve numbers

	def fibonacciSeries(0), do: [0]
	def fibonacciSeries(n), do: List.flatten(fibonacciSeries(n-1), [fibonacci(n)])

end
