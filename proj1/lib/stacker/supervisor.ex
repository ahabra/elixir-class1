defmodule Stacker.Supervisor do
	use Supervisor.Behaviour

	def start_link(stack) do
		:supervisor.start_link(__MODULE__, stack)
	end
	
	def init(stack) do
		children = [ worker(Stacker.Server, [stack])]
		supervise children, strategy: :one_for_one
	end
	

end