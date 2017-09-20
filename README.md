# Simple invoice system Rails app

The task is to prepare simple bookshop invoicing system. You can use provided template, places with missing code are marked with comments `# XXX`. You can also provide complete solution by creating project from scratch. 

___

In overall, system should consist of:

- invoice preparation (basket-like feature)
- invoice summary screen
- invoice checkout feature
- previous invoices list
- invoice details screen for previous invoices
- product management

# Products:

Product management should be done in CRUD fashion. Old invoices that include deleted products should be still showed correctly. Product list should include:

|Name|Code|Price|
|---|---|---|
|Eloquent Ruby|A|$99.99|
|Clean Ruby|B|$100.00|
|The Well-Grounded Rubyist|C|$200.00|
|Ruby Science|D|$49.99|
|Confident Ruby|E|$50.00|

Product name and code should be unique.

# Invoice preparation

System should allow cashier to add items to current invoice. If there is no current invoice then one should be created. Products added to current invoice should be stored in database and current invoice ID should be stored in user session.

Adding items to invoice can resemble 'basket' feature available in almost every internet store.

Adding items to current invoice (or 'basket') should be possible in two ways:

- by clicking 'add item to current invoice' button on products list
- by inputing product code in text box visible in 'current invoice' screen

Internally invoice addtion should use services (CQRS pattern, check out https://www.netguru.co/blog/service-objects-in-rails-will-help to learn more about CQRS).

# Current invoice screen

- Current invoice screen should contain all products added to basket, unit product prices, counts, product overall price (product price multiplied by count) and total price of invoice.
- Products added to current invoice multiple times should be showed in aggregated fashion.
- Each product should contain +/- buttons to change count of these products in current invoice
- Screen should contain field for adding products by code.
- There should be possibility to empty current invoice
- Current invoice state should be saved to database
- Current invoice id should be stored in user session

# Summary and checkout

- Product summary screen should contain all products added to basket, unit product prices, counts, product overall price (product price multiplied by count) and overall price of invoice.
- Invoice number generated on checkout should include year and month code and should look like "YY/MM/number_this_month". You can use query object (CQRS pattern).
- Submiting invoice to checkout should close this invoice and disable further modification. Closing invoice shouldn't be possible without assigning it invoice number.
- Checkout process should be implemented by using services (CQRS pattern).

# Automatic testing

Project should include automatic unit tests for products CRUD, adding product to current invoice service and checkout service.

___

# Additional points

- Use SLIM as a template engine.
- Use decorator to show prices (such as Draper).
- Prefer only REST methods as public controller methods (index, show, new, create, edit, update, delete).
- To prepare automatic testing use RSpec.

### Currency conversion
- Add possibility to do currency conversion for invoice total.
- Currency conversion should be available in checkout summary screen.
- There should be possibility to input 3 letter currency code. If there's no code provided invoice total should be showed in every currency available.
- Current conversion rates should be downloaded from external API available on [http://fixer.io]().

### Change
Add field to input money value gave by the customer so application can calculate change. Change can be calculated by clicking button or dynamically when user inputs value with help of some simple JavaScript.

___

# Suggestions

* Don’t worry too much about front-end but if you want to make a good impression you can use something like Bootstrap.
* Make sure README includes all required steps to run your app on Unix-like environment.
* You can use any PostgreSQL or SQLite as database.
* Project should be available as GitHub public repository. Please make multiple commits to show your workflow.

# Submitting solution

Clone this repository and create local repo. Ready application should be delivered as zip file. Please DON'T public solution as a public repo.

Before you send a solution add missing tests and make sure all tests are passing.

Working application should be deployed to Heroku and link to app should be included with your solution.

___

# Things to think about

Here are few additional things to think about. These aren't additional tasks and they shouldn't be part of your solution.

* How would you implement possibility to change products number in invoice summary by inputing product count.
* Is invoice numbering thread safe in your implementation and why?
* How would you change invoices numbering system so it uses all numbers and letters in english alphabet instead of YY/mm/number format.