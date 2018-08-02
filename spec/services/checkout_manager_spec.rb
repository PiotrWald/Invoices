# frozen_string_literal: true

require 'rails_helper'

describe 'checkout manager usage' do
  before :each do
    @invoice = Invoice.create
    @checkout_manager = CheckoutManager.new(@invoice)
    @product = Product.create(
      name: 'TestTest',
      code: 'XXX',
      price: 10
    )
  end

  it 'should be able to close opened invoice' do
    InvoicesProduct.create(
      product_id: @product.id,
      invoice_id: @invoice.id
    )
    @checkout_manager.close_invoice
    invoice = Invoice.find(@invoice.id)
    expect(invoice.closed?).to be true
  end

  it 'should not close emtpy invoices' do
    @checkout_manager.close_invoice
    invoice = Invoice.find(@invoice.id)
    expect(invoice.closed?).to be false
  end

  it 'should generate correct number' do
    InvoicesProduct.create(
      product_id: @product.id,
      invoice_id: @invoice.id
    )
    @checkout_manager.close_invoice
    invoice = Invoice.find(@invoice.id)
    number = Time.zone.today.strftime('%Y/%m/') + '1'
    expect(invoice.number).to eq(number)
  end
end
