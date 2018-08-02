# frozen_string_literal: true

class InvoicesProductsController < ApplicationController
  before_action :set_invoices_product, only: %i[update]
  before_action :set_invoice_and_manager

  def create
    if params[:creation_method] == 'by_id'
      @invoice_manager.add_product_by_id(params)
      redirect_to products_path
    elsif params[:creation_method] == 'by_code'
      @invoice_manager.add_product_by_code(params)
      redirect_to @invoice
    end
  end

  def update
    if params[:change] == 'increase'
      @invoice_manager.increase_product_count_by_one(@invoices_product)
    elsif params[:change] == 'decrease'
      @invoice_manager.decrease_product_count_by_one(@invoices_product)
    end
    redirect_to @invoices_product.invoice
  end

  private

  def set_invoices_product
    @invoices_product = InvoicesProduct.find(params[:id])
  end

  def set_invoice_and_manager
    @invoice = Invoice.find_or_create_by(status: :opened)
    @invoice_manager = InvoicesManager.new(@invoice)
  end
end
