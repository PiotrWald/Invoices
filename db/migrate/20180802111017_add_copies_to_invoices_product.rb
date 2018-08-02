class AddCopiesToInvoicesProduct < ActiveRecord::Migration[5.1]
  def change
  	add_column :invoices_products, :copies, :integer, default: 1
  end
end
