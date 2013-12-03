# to run this test by itself: 
# mix test test/p4_echo2_test.exs
defmodule Echo2Test do
	use ExUnit.Case

	test "pong" do
		Echo2.ping("123")
		Echo2.ping("stop this crap")
		Echo2.ping("do not be a richard")
		# TODO find a way to test the result of actor message
	end

end
