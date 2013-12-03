defmodule Intro do
	
	def f1 do
		42
	end
	
	def pi, do: 3.14

	def max1(a,b) do
		if a > b do
			a
		else
			b
		end
	end

	def max2(a,b) do
		if a>b, do: a, else: b
	end

	def lists do
		list = [1, 2, "42"]
		[head | tail] = list
		# now, head=1, tail=[2, "42"]

		[_ | tail] = tail
		# now, tail=["42"]

		[head] = tail
		head
	end
	
	def tuples do
		tuple = {1, 2, "hi", :atom1}
		el = elem(tuple, 3)  # get an element from tuple at index 3
		#now, el= :atom1
		set_elem(tuple, 0, el)  # set element at index 0
	end

	def listOfTuples do
		list = [red: 10, blue: 20, green: 30]
		Keyword.get list, :blue
	end

	defp privateFunction do
		# whatever
	end

	def identity(x) when is_number(x) do
		0
	end

	def identity(x) when is_bitstring(x), do:	""
	def identity(x) when is_list(x), do:	[]
	def identity(x) when is_tuple(x), do:	{}
	def identity(x), do: 0
	

end
