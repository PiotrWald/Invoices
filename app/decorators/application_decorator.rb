# frozen_string_literal: true

class ApplicationDecorator < Draper::Decorator
  def wrap_in_dolar(number)
    '$' + number.to_s
  end
end
