# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[edit update destroy]

  # GET /products
  # GET /products.json
  def index
    # TODO
  end

  # GET /products/1
  # GET /products/1.json
  def show
    # TODO
  end

  # GET /products/new
  def new
    # TODO
  end

  # GET /products/1/edit
  def edit; end

  # POST /products
  # POST /products.json
  def create
    # TODO
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    # TODO
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # TODO
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    # TODO
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product).permit(:name, :code, :price)
  end
end
