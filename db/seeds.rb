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

codes = ['A', 'B', 'C', 'D', 'E']

40.times do |n|

	product = Product.create(
		name: "Product #{n}",
		code: codes[rand(5)],
		price: n * 10
		)
end

p 'Created 40 products...'