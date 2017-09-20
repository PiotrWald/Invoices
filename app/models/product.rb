# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :invoices_product, dependent: :restrict_with_exception

  # TODO
end
