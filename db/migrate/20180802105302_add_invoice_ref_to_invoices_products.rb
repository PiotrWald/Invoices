class AddInvoiceRefToInvoicesProducts < ActiveRecord::Migration[5.1]
  def change
    add_reference :invoices_products, :invoice, foreign_key: true
    add_reference :invoices_products, :product, foreign_key: true
  end
end
