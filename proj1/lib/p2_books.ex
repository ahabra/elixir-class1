defmodule Books do
	defrecord Book, title: nil, author: nil, price: 0
	defrecord OrderLineItem, book: nil, quantity: 0

	def createBook(title, author, price) do
		Book.new(title: title, author: author, price: price)
	end

	def bookList() do
		[
			createBook("t1", "a1", 10),
			createBook("t2", "a2", 20),
			createBook("t3", "a3", 30),
			createBook("t4", "a4", 40)
		]
	end

	def cheapBooks(bookList, max) do
		Enum.filter(bookList, fn(book) -> book.price < max end)
		# Enum.filter(bookList, &(&1.price < max) )
	end

	def placeOrder(bookList) do
		# Enum.map(bookList, &(OrderLineItem.new(book: &1, quantity: 1)))
		Enum.map(bookList, fn(book) -> OrderLineItem.new(book: book, quantity: 1) end )
	end
	
	def calcPrice(lineItems) do
		#Enum.reduce(lineItems, 0, &(&2 + &1.book.price * &1.quantity ))
		Enum.reduce(lineItems, 0, fn(line, acc) -> acc + line.book.price * line.quantity end)
	end

	# price + tax
	def total(price) do
		price * 1.1
	end

end 