class CreateInvoicesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices_products do |t|
      t.string :number
      t.integer :status
      t.decimal :total, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
