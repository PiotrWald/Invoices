# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show]

  def index
    @invoices = Invoice.all
  end

  def show; end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
    @invoices_products = @invoice.invoices_products
    @invoices_product = InvoicesProduct.new
    @is_invoice = true
  end
end
