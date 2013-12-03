# to run this test by itself: 
# mix test test/p2_books_test.exs
defmodule BooksTest do
	use ExUnit.Case
	import Books

	test "createBook" do
		book = createBook("title1", "author1", 10)
		assert book.author == "author1"
		assert book.title == "title1"
		assert book.price == 10
	end
	
	test "bookList" do
		assert length(bookList()) == 4
	end

	test "cheapBooks" do
		bookList = bookList()
		cheapBooks = cheapBooks(bookList, 30)

		bad = Enum.find(cheapBooks, fn(book) -> book.price >=30 end)
		assert !bad
	end

	test "placeOrder" do
		bookList = bookList()
		cheapBooks = cheapBooks(bookList, 30)

		lineItems = placeOrder(cheapBooks)
		assert length(lineItems) == length(cheapBooks)
	end

	test "calcPrice" do
		bookList = bookList()
		cheapBooks = cheapBooks(bookList, 30)
		lineItems = placeOrder(cheapBooks)

		price = calcPrice(lineItems)
		assert price == 30
	end

	test "total" do
		bookList = bookList()
		cheapBooks = cheapBooks(bookList, 30)
		lineItems = placeOrder(cheapBooks)
		price = calcPrice(lineItems)
		total = total(price)

		assert total == 33
	end

	test "total using nested calls" do
		total = total(calcPrice(placeOrder(cheapBooks(bookList(), 30))))
		assert total == 33
	end

	# pipe takes the result of the expression to its left
	# and use it as the 1st parameter on the function to its right 
	test "total using pipes" do
		total= bookList
			|> cheapBooks(30)
			|> placeOrder
			|> calcPrice
			|> total

		assert total == 33
	end

end
