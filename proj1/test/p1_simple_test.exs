# to run this test by itself: 
# mix test test/p1_simple_test.exs
defmodule SimpleTest do
	use ExUnit.Case
	import Simple

	test "doubleList" do
		assert doubleList([1,2,3]) == [2,4,6]
	end  

	test "sumList" do
		assert sumList([1,2,3]) == 6
	end

	test "factorial" do
		assert factorial(3) == 6
		assert factorial(5) == 120
		assert factorial(10) == 3628800
		assert factorial(0) == 0
		assert factorial(-4) == 0
	end

	test "fibonacci" do
		assert fibonacci(0) == 0
		assert fibonacci(1) == 1
		assert fibonacci(2) == 1
		assert fibonacci(3) == 2
		assert fibonacci(4) == 3
		assert fibonacci(5) == 5
		assert fibonacci(6) == 8
	end

	test "fibonacciSeries" do
		assert fibonacciSeries(0) == [0]
		assert fibonacciSeries(1) == [0, 1]
		assert fibonacciSeries(2) == [0, 1, 1]
		assert fibonacciSeries(3) == [0, 1, 1, 2]
		assert fibonacciSeries(4) == [0, 1, 1, 2, 3]
		assert fibonacciSeries(5) == [0, 1, 1, 2, 3, 5]
		assert fibonacciSeries(6) == [0, 1, 1, 2, 3, 5, 8]
		assert fibonacciSeries(7) == [0, 1, 1, 2, 3, 5, 8, 13]
	end

end
