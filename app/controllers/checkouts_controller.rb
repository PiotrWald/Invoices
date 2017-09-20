# frozen_string_literal: true

class CheckoutsController < ApplicationController
  before_action :set_invoice, only: %i[new create]

  def new; end

  def create
    # TODO
  end

  private

  def set_invoice
    # TODO
  end
end
