# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_invoice, only: %i[new create]

  def new; end

  def create
    CheckoutManager.new(@invoice).close_invoice
    redirect_to products_path
  end

  private

  def set_invoice
    @invoice = Invoice.find_by(status: :opened)
    @invoices_products = @invoice.invoices_products
  end
end
