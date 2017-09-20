# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show]

  # GET /invoices
  # GET /invoices.json
  def index
    # TODO
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_invoice
    # TODO
  end
end
