# frozen_string_literal: true

class ProductDecorator < ApplicationDecorator
  delegate_all

  def price
    wrap_in_dolar(object.price)
  end
end
