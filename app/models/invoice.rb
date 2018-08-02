# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_many :invoices_products, dependent: :restrict_with_exception
  enum status: %i[opened closed]
end
