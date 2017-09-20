# frozen_string_literal: true

class InvoicesProduct < ApplicationRecord
  belongs_to :product
  belongs_to :invoice, touch: true

  # TODO
end
