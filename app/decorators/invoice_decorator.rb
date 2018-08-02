# frozen_string_literal: true

class InvoiceDecorator < ApplicationDecorator
  delegate_all

  def total
    wrap_in_dolar(object.total)
  end
end
