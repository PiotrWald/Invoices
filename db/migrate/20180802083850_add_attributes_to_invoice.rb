class AddAttributesToInvoice < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :number, :string
    add_column :invoices, :total, :decimal, :precision => 8, :scale => 2
    add_column :invoices, :status, :integer
  end
end
