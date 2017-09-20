# frozen_string_literal: true

class Invoice < ApplicationRecord
  has_many :invoices_product, dependent: :restrict_with_exception

  # TODO
end
