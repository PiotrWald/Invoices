class CreateInvoicesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices_products do |t|

      t.timestamps
    end
  end
end
