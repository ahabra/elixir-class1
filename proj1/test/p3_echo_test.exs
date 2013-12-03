# to run this test by itself: 
# mix test test/p3_echo_test.exs
defmodule EchoTest do
	use ExUnit.Case

	test "pong" do
		Echo.ping("123")
		Echo.ping("abc")
		# TODO find a way to test the result of actor message
	end

end
