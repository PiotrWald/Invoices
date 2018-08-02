# frozen_string_literal: true

class InvoicesManager
  def initialize(invoice)
    @invoice = invoice
  end

  def add_product_by_id(params)
    product_id = params[:invoices_product][:product_id]
    return false unless (product = Product.find(product_id))

    invoice_product = InvoicesProduct.find_by product_id: product.id, invoice_id: @invoice.id

    if invoice_product
      increase_product_count_by_one(invoice_product)
    else
      invoice_product = InvoicesProduct.create(invoice_id: @invoice.id, product_id: product_id)
      update_invoice_total
    end
    invoice_product
  end

  def add_product_by_code(params)
    code = params[:code]
    return false unless (product = Product.find_by(code: code))

    invoice_product = InvoicesProduct.find_by product_id: product.id, invoice_id: @invoice.id

    if invoice_product
      increase_product_count_by_one(invoice_product)
    else
      invoice_product = InvoicesProduct.create(invoice_id: @invoice.id, product_id: product.id)
      update_invoice_total
    end
    invoice_product
  end

  def increase_product_count_by_one(invoice_product)
    invoice_product.copies = invoice_product.copies + 1
    invoice_product.save
    update_invoice_total
  end

  def decrease_product_count_by_one(invoice_product)
    if invoice_product.copies == 1
      invoice_product.destroy
    else
      invoice_product.copies = invoice_product.copies - 1
      invoice_product.save
    end

    update_invoice_total
  end

  private

  def update_invoice_total
    sum = 0

    @invoice.invoices_products.each do |p|
      sum += p.product.price * p.copies
    end

    @invoice.total = sum
    @invoice.save
  end
end
