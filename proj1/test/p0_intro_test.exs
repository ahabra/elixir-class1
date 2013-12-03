# to run this test by itself: 
# mix test test/p0_intro_test.exs
defmodule IntroTest do
	use ExUnit.Case

	test "functions" do
   	assert Intro.f1() == 42
   	assert Intro.f1 == 42

		assert Intro.pi == 3.14
	end

	test "if" do
		assert Intro.max1(1,3) == 3
		assert Intro.max2(1,3) == 3
	end

	test "lists" do
		assert Intro.lists == "42"
	end

	test "tuples" do
		assert Intro.tuples == {:atom1, 2, "hi", :atom1}
		assert Intro.listOfTuples == 20
	end

	test "identity" do
		import Intro
		assert identity(4) == 0
		assert identity("abc") == ""
		assert identity([1,2]) == []
		assert identity({1,2}) == {}
		assert identity( :atom ) == 0
	end

end