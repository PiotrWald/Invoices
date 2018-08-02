# frozen_string_literal: true

require 'rails_helper'

describe 'invoice manager usage' do
  describe 'adding new product' do
    before :each do
      @invoice = Invoice.create
      @invoice_manager = InvoicesManager.new(@invoice)
      @product = Product.create(
        name: 'TestTest',
        code: 'XXX',
        price: 10
      )
    end

    it 'add_product_by_id should add new product to invoice' do
      params = {invoices_product: {}}
      params[:invoices_product][:product_id] = @product.id
      @invoice_manager.add_product_by_id(params)
      expect(@invoice.invoices_products.first.product.id).to eq(@product.id)
    end

    it 'add_product_by_code should add new product to invoice' do
      params = {}
      params[:code] = 'XXX'
      @invoice_manager.add_product_by_code(params)
      expect(@invoice.invoices_products.first.product.id).to eq(@product.id)
    end
  end

  describe 'adding and substracting product count' do
    before :each do
      @invoice = Invoice.create
      @invoice_manager = InvoicesManager.new(@invoice)
      @product = Product.create(
        name: 'TestTest',
        code: 'XXX',
        price: 10
      )
      @invoices_product = InvoicesProduct.create(
        invoice_id: @invoice.id,
        product_id: @product.id
      )
    end

    it 'increase_product_count_by_one should increase number of copies' do
      @invoice_manager.increase_product_count_by_one(@invoices_product)
      expect(@invoices_product.copies).to eq(2)
    end

    it 'decrease_product_count_by_one should decrease number of copies' do
      @invoice_manager.increase_product_count_by_one(@invoices_product)
      @invoice_manager.decrease_product_count_by_one(@invoices_product)
      expect(@invoices_product.copies).to eq(1)
    end

    it 'decrease_product_count_by_one should remove one-copy product' do
      @invoice_manager.decrease_product_count_by_one(@invoices_product)
      expect(@invoice.invoices_products.count).to eq(0)
    end
  end
end
