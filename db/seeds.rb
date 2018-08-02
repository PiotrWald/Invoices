# Generating Products

books = [
	['Eloquent Ruby', 'A', 99.99],
	['Clean Ruby', 'B', 100.00],
	['The Well-Grounded Rubyist', 'C', 200.00],
	['Ruby Science', 'D', 49.99],
	['Confident Ruby', 'E', 50.00]]

books.each do |values|
	Product.create(
		name: values[0],
		code: values[1],
		price: values[2]
	)
end

p 'Created 5 cool products'

20.times do |n|

	product = Product.create(
		name: "Product #{n}",
		code: (70 + n).chr,
		price: n * 10
		)
end

p 'Created 20 products...'