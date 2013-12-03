defmodule Echo do
	def pong do
		receive do  # wait in this process until u receive a msg
			{sender, msg} ->
				sender <- { :ok, String.reverse(msg)}
				pong  #this recursion will be optimized as it is last statment (tail)
		end
	end

	def ping(msg) do
		# spawn a process for Echo.pong
		pid = spawn(Echo, :pong, [])

		pid <- {self, msg}  # send a msg to pid. self is current process id
		receive do   # wait in this process until u receive a msg
			{ :ok, message} ->
				IO.puts "Echo: ping: #{msg}, pong: #{message}"
		end
	end

end
