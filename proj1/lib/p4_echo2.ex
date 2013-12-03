defmodule Echo2 do
	def pong do
		badWords = ["crap", "richard"]
		receive do
			{sender, msg} ->
				if String.contains?(msg, badWords) do
					sender <- { :bad, "O'behave."}
				else 
					sender <- { :ok, String.reverse(msg)}
				end
				pong  # this tail recursion will be optimized
		end
	end

	def ping(msg) do
		pid = spawn(Echo2, :pong, [])

		pid <- {self, msg}
		receive do
			{ :ok, message } ->
				IO.puts "Echo2: ping: #{msg}, pong: #{message}"
			{ :bad, message} ->
				IO.puts "Echo2: ping: #{msg}, pong: #{message}"
		end

	end

end
