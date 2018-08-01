# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :invoices_product, dependent: :restrict_with_exception
  validates :name, presence: true
  validates :code, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
end
